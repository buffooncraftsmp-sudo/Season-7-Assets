// Turns the Chunkbase seed map into an antique-style map painting.
// Biome pixels are never moved: only recoloured and decorated in place.
using System;
using System.Collections.Generic;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.Drawing.Imaging;
using System.Drawing.Text;
using System.Runtime.InteropServices;

public static class OldMap
{
    // ---------- noise helpers ----------
    static uint Hs(int x, int y, int s) { unchecked { uint h = (uint)(x * 374761393 + y * 668265263 + s * 1442695041); h = (h ^ (h >> 13)) * 1274126177u; return h ^ (h >> 16); } }
    static double H01(int x, int y, int s) { return (Hs(x, y, s) & 0xFFFFFF) / 16777215.0; }
    static double VN(double x, double y, int s)
    {
        int xi = (int)Math.Floor(x), yi = (int)Math.Floor(y);
        double fx = x - xi, fy = y - yi; fx = fx * fx * (3 - 2 * fx); fy = fy * fy * (3 - 2 * fy);
        double a = H01(xi, yi, s), b = H01(xi + 1, yi, s), c = H01(xi, yi + 1, s), d = H01(xi + 1, yi + 1, s);
        double top = a + (b - a) * fx, bot = c + (d - c) * fx;
        return top + (bot - top) * fy;
    }
    static double Fbm(double x, double y, int oct, int s)
    {
        double t = 0, amp = 1, norm = 0;
        for (int i = 0; i < oct; i++) { t += amp * VN(x, y, s + i * 17); norm += amp; amp *= 0.5; x *= 2.03; y *= 2.03; }
        return t / norm;
    }
    static double Cl(double v) { return v < 0 ? 0 : (v > 1 ? 1 : v); }
    static double Lerp(double a, double b, double t) { return a + (b - a) * t; }
    static int Lum(int c) { return ((c >> 16) & 255) + ((c >> 8) & 255) + (c & 255); }

    static int[] ReadPx(Bitmap b)
    {
        var d = b.LockBits(new Rectangle(0, 0, b.Width, b.Height), ImageLockMode.ReadOnly, PixelFormat.Format32bppArgb);
        var px = new int[b.Width * b.Height]; Marshal.Copy(d.Scan0, px, 0, px.Length); b.UnlockBits(d); return px;
    }
    static void WritePx(Bitmap b, int[] px)
    {
        var d = b.LockBits(new Rectangle(0, 0, b.Width, b.Height), ImageLockMode.WriteOnly, PixelFormat.Format32bppArgb);
        Marshal.Copy(px, 0, d.Scan0, px.Length); b.UnlockBits(d);
    }
    static int Pack(double r, double g, double b)
    {
        int R = (int)Math.Round(Cl(r) * 255), G = (int)Math.Round(Cl(g) * 255), B = (int)Math.Round(Cl(b) * 255);
        return unchecked((int)0xFF000000) | (R << 16) | (G << 8) | B;
    }

    // ---------- main ----------
    public static string Run(string src, string dst)
    {
        var log = new System.Text.StringBuilder();
        Bitmap sb = new Bitmap(src);
        int w = sb.Width, h = sb.Height, n = w * h;
        int[] px = ReadPx(sb); sb.Dispose();

        // Grid line pixel positions detected from the source (1000 blocks = ~78.75px)
        int[] cols = { 79, 158, 237, 315, 394, 473, 552, 630, 709, 788, 867, 945, 1024, 1103, 1182, 1260, 1339, 1418, 1497, 1575, 1654, 1733, 1812 };
        int[] rows = { 77, 156, 235, 314, 392, 471, 550, 629, 707, 786, 865 };
        const int originCol = 11, originRow = 5; // spawn marker sits on cols[11] x rows[5]

        // 1. Remove Chunkbase's grid (1px dark line + faint neighbour) using adjacent pixels
        foreach (int x in cols) for (int y = 0; y < h; y++) { px[y * w + x] = px[y * w + x - 1]; if (x + 2 < w) px[y * w + x + 1] = px[y * w + x + 2]; }
        foreach (int y in rows) for (int x = 0; x < w; x++) { px[y * w + x] = px[(y - 1) * w + x]; if (y + 2 < h) px[(y + 1) * w + x] = px[(y + 2) * w + x]; }
        // Possible partial lines on the very edge rows/cols
        int dark = 0; for (int x = 0; x < w; x++) if (Lum(px[(h - 1) * w + x]) < Lum(px[(h - 2) * w + x]) - 6) dark++;
        if (dark > w * 0.35) { for (int x = 0; x < w; x++) px[(h - 1) * w + x] = px[(h - 2) * w + x]; log.Append("removed bottom edge line; "); }
        dark = 0; for (int y = 0; y < h; y++) if (Lum(px[y * w]) < Lum(px[y * w + 1]) - 6) dark++;
        if (dark > h * 0.35) { for (int y = 0; y < h; y++) px[y * w] = px[y * w + 1]; log.Append("removed left edge line; "); }

        // 2. Classify: 0 land, 1 water, 2 pure river
        byte[] cls = new byte[n];
        for (int i = 0; i < n; i++)
        {
            int r = (px[i] >> 16) & 255, g = (px[i] >> 8) & 255, b = px[i] & 255;
            bool river = (b >= 215 && r <= 20 && g <= 20) || (r >= 150 && r <= 175 && g >= 150 && g <= 175 && b >= 245);
            bool wat = (b >= r + 20 && b >= g + 20 && r < 120 && g < 120) || (b >= 200 && r < 130 && g < 130 && b - r >= 80);
            cls[i] = (byte)(river ? 2 : (wat ? 1 : 0));
        }
        // Real ocean = water after a 2px morphological opening (drops river edges / thin channels), big components only
        bool[] wm = new bool[n]; for (int i = 0; i < n; i++) wm[i] = cls[i] == 1;
        bool[] op = Dilate(Erode(wm, w, h, 2), w, h, 2);
        bool[] ocean = new bool[n]; for (int i = 0; i < n; i++) ocean[i] = wm[i] && op[i];
        RemoveSmall(ocean, w, h, 250);

        // Chamfer distance (in px) from non-ocean into ocean, for coastal ripple lines
        double[] dist = Chamfer(ocean, w, h);

        // 3. Hand-tinted wash colours (0..1)
        double[] mr = new double[n], mg = new double[n], mb = new double[n];
        for (int i = 0; i < n; i++)
        {
            double R = ((px[i] >> 16) & 255) / 255.0, G = ((px[i] >> 8) & 255) / 255.0, B = (px[i] & 255) / 255.0;
            double r, g, b;
            if (cls[i] == 2)
            {
                if (R > 0.5) { r = 128 / 255.0; g = 146 / 255.0; b = 160 / 255.0; }   // frozen river
                else { r = 86 / 255.0; g = 118 / 255.0; b = 142 / 255.0; }            // river ink
            }
            else if (cls[i] == 1 && !ocean[i])
            {
                // Anti-aliased river edges / tiny inland water: river ink blended with the land wash by blueness
                double Y = 0.299 * R + 0.587 * G + 0.114 * B, s = 0.45;
                double lr = (0.40 + 0.60 * (Y + s * (R - Y))) * 1.04, lg = (0.40 + 0.60 * (Y + s * (G - Y))) * 0.99, lb = (0.40 + 0.60 * (Y + s * (B - Y))) * 0.80;
                double bl = Cl((B - Math.Max(R, G)) / 0.6);
                r = Lerp(lr, 86 / 255.0, bl); g = Lerp(lg, 118 / 255.0, bl); b = Lerp(lb, 142 / 255.0, bl);
            }
            else if (cls[i] == 1)
            {
                double br = Math.Max(R, Math.Max(G, B)), cold = B > 0.01 ? R / B : 0;
                double t = Cl((br - 0.18) / 0.52);
                r = Lerp(122, 186, t) / 255.0; g = Lerp(160, 214, t) / 255.0; b = Lerp(184, 228, t) / 255.0;
                double cm = Math.Min(Cl(cold * 1.15), 0.65), k = 0.8 + 0.3 * t;
                r = Lerp(r, 172 * k / 255.0, cm); g = Lerp(g, 178 * k / 255.0, cm); b = Lerp(b, 194 * k / 255.0, cm);
            }
            else
            {
                double Y = 0.299 * R + 0.587 * G + 0.114 * B, s = 0.45;
                r = Y + s * (R - Y); g = Y + s * (G - Y); b = Y + s * (B - Y);
                r = (0.40 + 0.60 * r) * 1.04; g = (0.40 + 0.60 * g) * 0.99; b = (0.40 + 0.60 * b) * 0.80;
            }
            mr[i] = r; mg[i] = g; mb[i] = b;
        }
        // Faint ink along strong biome borders on land
        for (int y = 0; y < h - 1; y++) for (int x = 0; x < w - 1; x++)
        {
            int i = y * w + x; if (cls[i] != 0) continue;
            int j1 = i + 1, j2 = i + w;
            int d1 = cls[j1] == 0 ? CDiff(px[i], px[j1]) : 0, d2 = cls[j2] == 0 ? CDiff(px[i], px[j2]) : 0;
            if (d1 > 110 || d2 > 110) { mr[i] *= 0.9; mg[i] *= 0.9; mb[i] *= 0.9; }
        }
        // Coastline ink, coastal shading and engraved ripple lines
        double[] rk = { 4.5, 9, 14.5, 21 }, ra = { 0.34, 0.24, 0.15, 0.08 };
        for (int y = 0; y < h; y++) for (int x = 0; x < w; x++)
        {
            int i = y * w + x;
            if (!ocean[i])
            {
                bool coast = false;
                for (int dy = -1; dy <= 1 && !coast; dy++) for (int dx = -1; dx <= 1; dx++)
                {
                    int xx = x + dx, yy = y + dy; if (xx < 0 || yy < 0 || xx >= w || yy >= h) continue;
                    if (ocean[yy * w + xx]) { coast = true; break; }
                }
                if (coast) { mr[i] = Lerp(mr[i], 84 / 255.0, 0.62); mg[i] = Lerp(mg[i], 60 / 255.0, 0.62); mb[i] = Lerp(mb[i], 40 / 255.0, 0.62); }
                continue;
            }
            double d = dist[i], f = 1 - 0.12 * Math.Exp(-d / 2.5);
            mr[i] *= f; mg[i] *= f; mb[i] *= f;
            for (int k = 0; k < rk.Length; k++)
            {
                double a = ra[k] * Cl(1 - Math.Abs(d - rk[k]) / 0.75);
                if (a > 0) { mr[i] = Lerp(mr[i], 62 / 255.0, a); mg[i] = Lerp(mg[i], 86 / 255.0, a); mb[i] = Lerp(mb[i], 96 / 255.0, a); }
            }
        }

        // 4. Canvas: 2:1 with a graduated border. Map sits unscaled at (ox, oy).
        int ox = 91, oy = 45, W = w + 2 * ox, H = h + 2 * oy;   // 2071 x 1035
        int N = W * H;
        double[] CR = new double[N], CG = new double[N], CB = new double[N];
        for (int y = 0; y < H; y++) for (int x = 0; x < W; x++)
        {
            int i = y * W + x;
            double n1 = Fbm(x / 280.0, y / 280.0, 4, 11), n2 = Fbm(x / 45.0, y / 45.0, 3, 23);
            double f = 0.9 + 0.15 * n1 + 0.06 * n2;
            CR[i] = 239 / 255.0 * f; CG[i] = 227 / 255.0 * f * (0.985 + 0.03 * n1); CB[i] = 197 / 255.0 * f * (0.93 + 0.1 * n1);
        }
        for (int y = 0; y < h; y++) for (int x = 0; x < w; x++)
        {
            int i = (y + oy) * W + (x + ox), j = y * w + x;
            CR[i] = Math.Min(1, CR[i] * mr[j] * 1.07); CG[i] = Math.Min(1, CG[i] * mg[j] * 1.07); CB[i] = Math.Min(1, CB[i] * mb[j] * 1.07);
        }
        // Redraw the 1000-block grid in ink at the exact original pixel positions
        for (int k = 0; k < cols.Length; k++)
        {
            double a = k == originCol ? 0.62 : 0.45; int X = cols[k] + ox;
            for (int y = oy; y < oy + h; y++) InkPx(CR, CG, CB, y * W + X, a);
        }
        for (int k = 0; k < rows.Length; k++)
        {
            double a = k == originRow ? 0.62 : 0.45; int Y = rows[k] + oy;
            for (int x = ox; x < ox + w; x++) InkPx(CR, CG, CB, Y * W + x, a);
        }

        int[] cpx = new int[N]; for (int i = 0; i < N; i++) cpx[i] = Pack(CR[i], CG[i], CB[i]);
        Bitmap cb = new Bitmap(W, H, PixelFormat.Format32bppArgb); WritePx(cb, cpx);

        // 5. Frame, coordinate labels, key and spawn marker
        using (Graphics g = Graphics.FromImage(cb))
        {
            g.SmoothingMode = SmoothingMode.AntiAlias; g.TextRenderingHint = TextRenderingHint.AntiAliasGridFit; g.PixelOffsetMode = PixelOffsetMode.HighQuality;
            Color ink = Color.FromArgb(255, 58, 38, 22);
            Color paper = Color.FromArgb(255, 238, 226, 196);
            var inkB = new SolidBrush(ink);
            var pen1 = new Pen(ink, 1.5f); var pen3 = new Pen(ink, 3f);

            var xs = new List<float> { 0 }; foreach (int c in cols) xs.Add(c + 0.5f); xs.Add(w);
            var ys = new List<float> { 0 }; foreach (int r in rows) ys.Add(r + 0.5f); ys.Add(h);
            for (int i = 0; i < xs.Count - 1; i++) if (i % 2 == 0)
            {
                g.FillRectangle(inkB, ox + xs[i], oy - 10, xs[i + 1] - xs[i], 10);
                g.FillRectangle(inkB, ox + xs[i], oy + h, xs[i + 1] - xs[i], 10);
            }
            for (int i = 0; i < ys.Count - 1; i++) if (i % 2 == 0)
            {
                g.FillRectangle(inkB, ox - 10, oy + ys[i], 10, ys[i + 1] - ys[i]);
                g.FillRectangle(inkB, ox + w, oy + ys[i], 10, ys[i + 1] - ys[i]);
            }
            g.FillRectangle(inkB, ox - 10, oy - 10, 10, 10); g.FillRectangle(inkB, ox + w, oy - 10, 10, 10);
            g.FillRectangle(inkB, ox - 10, oy + h, 10, 10); g.FillRectangle(inkB, ox + w, oy + h, 10, 10);
            g.DrawRectangle(pen1, ox - 0.5f, oy - 0.5f, w + 1, h + 1);
            g.DrawRectangle(pen1, ox - 10.5f, oy - 10.5f, w + 21, h + 21);
            g.DrawRectangle(pen3, ox - 16, oy - 16, w + 32, h + 32);

            var lf = new Font("Book Antiqua", 13f, FontStyle.Regular, GraphicsUnit.Pixel);
            var af = new Font("Book Antiqua", 15f, FontStyle.Bold | FontStyle.Italic, GraphicsUnit.Pixel);
            var cen = new StringFormat { Alignment = StringAlignment.Center, LineAlignment = StringAlignment.Center };
            var far = new StringFormat { Alignment = StringAlignment.Far, LineAlignment = StringAlignment.Center };
            var near = new StringFormat { Alignment = StringAlignment.Near, LineAlignment = StringAlignment.Center };
            for (int k = 0; k < cols.Length; k++)
            {
                string s = ((k - originCol) * 1000).ToString(); float cx = ox + cols[k] + 0.5f;
                g.DrawString(s, lf, inkB, new RectangleF(cx - 40, 3, 80, 24), cen);
                g.DrawString(s, lf, inkB, new RectangleF(cx - 40, oy + h + 18, 80, 24), cen);
            }
            for (int k = 0; k < rows.Length; k++)
            {
                string s = ((k - originRow) * 1000).ToString(); float cy = oy + rows[k] + 0.5f;
                g.DrawString(s, lf, inkB, new RectangleF(2, cy - 12, ox - 24, 24), far);
                g.DrawString(s, lf, inkB, new RectangleF(ox + w + 22, cy - 12, 70, 24), near);
            }
            g.DrawString("X", af, inkB, new RectangleF(2, 3, ox - 24, 24), far);
            g.DrawString("Z", af, inkB, new RectangleF(2, oy + 12, ox - 24, 24), far);

            // Spawn marker over Chunkbase's spawn icon
            float sx = ox + cols[originCol] + 0.5f, sy = oy + rows[originRow] + 0.5f;
            g.FillEllipse(new SolidBrush(paper), sx - 14, sy - 14, 28, 28);
            g.DrawEllipse(pen1, sx - 13, sy - 13, 26, 26);
            DrawStar(g, sx, sy, 11, 6, 2.5f, ink, paper);
            var sf = new Font("Book Antiqua", 13f, FontStyle.Italic, GraphicsUnit.Pixel);
            using (var gp = new GraphicsPath())
            {
                gp.AddString("Spawn", sf.FontFamily, (int)FontStyle.Italic, 13f, new PointF(sx + 16, sy - 9), StringFormat.GenericDefault);
                g.DrawPath(new Pen(Color.FromArgb(230, paper), 3.5f) { LineJoin = LineJoin.Round }, gp);
                g.FillPath(inkB, gp);
            }

            // Key, bottom right inside the map
            int kw = 300, kh = 108, kx = ox + w - 14 - kw, ky = oy + h - 14 - kh;
            g.FillRectangle(new SolidBrush(Color.FromArgb(70, 40, 25, 10)), kx + 4, ky + 4, kw, kh);
            g.FillRectangle(new SolidBrush(Color.FromArgb(250, 240, 229, 200)), kx, ky, kw, kh);
            g.DrawRectangle(new Pen(ink, 2f), kx, ky, kw, kh);
            g.DrawRectangle(new Pen(ink, 1f), kx + 4, ky + 4, kw - 8, kh - 8);
            float ccx = kx + 54, ccy = ky + 62;
            g.DrawEllipse(new Pen(ink, 1f), ccx - 24, ccy - 24, 48, 48);
            DrawStar(g, ccx, ccy, 32, 15, 5, ink, Color.FromArgb(255, 240, 229, 200));
            g.DrawString("N", new Font("Book Antiqua", 15f, FontStyle.Bold, GraphicsUnit.Pixel), inkB, new RectangleF(ccx - 15, ky + 6, 30, 18), cen);
            g.DrawLine(new Pen(ink, 1f), kx + 108, ky + 12, kx + 108, ky + kh - 12);
            float rx0 = kx + 112, rw = kw - 112 - 8;
            g.DrawString("SCALE OF BLOCKS", new Font("Book Antiqua", 14f, FontStyle.Bold, GraphicsUnit.Pixel), inkB, new RectangleF(rx0, ky + 10, rw, 20), cen);
            float seg = 78.75f, bw = seg * 2, bx = rx0 + (rw - bw) / 2, by = ky + 38;
            g.FillRectangle(inkB, bx, by, seg, 8);
            g.DrawRectangle(new Pen(ink, 1.2f), bx, by, bw, 8);
            var tf = new Font("Book Antiqua", 12f, FontStyle.Regular, GraphicsUnit.Pixel);
            g.DrawString("0", tf, inkB, new RectangleF(bx - 20, by + 10, 40, 16), cen);
            g.DrawString("1000", tf, inkB, new RectangleF(bx + seg - 25, by + 10, 50, 16), cen);
            g.DrawString("2000", tf, inkB, new RectangleF(bx + bw - 25, by + 10, 50, 16), cen);
            g.DrawString("One square = 1000 blocks", new Font("Book Antiqua", 13f, FontStyle.Italic, GraphicsUnit.Pixel), inkB, new RectangleF(rx0, ky + 70, rw, 22), cen);
        }

        // 6. Aging over everything: grain, stains, foxing, fold creases, worn edges
        cpx = ReadPx(cb);
        for (int i = 0; i < N; i++) { CR[i] = ((cpx[i] >> 16) & 255) / 255.0; CG[i] = ((cpx[i] >> 8) & 255) / 255.0; CB[i] = (cpx[i] & 255) / 255.0; }
        var rnd = new Random(7);
        for (int s = 0; s < 8; s++)
        {
            double scx = rnd.NextDouble() * W, scy = rnd.NextDouble() * H, rad = 60 + rnd.NextDouble() * 170; int seed = 100 + s;
            int x0 = Math.Max(0, (int)(scx - rad * 1.4)), x1 = Math.Min(W - 1, (int)(scx + rad * 1.4));
            int y0 = Math.Max(0, (int)(scy - rad * 1.4)), y1 = Math.Min(H - 1, (int)(scy + rad * 1.4));
            for (int y = y0; y <= y1; y++) for (int x = x0; x <= x1; x++)
            {
                double dd = Math.Sqrt((x - scx) * (x - scx) + (y - scy) * (y - scy)) / rad + 0.35 * (Fbm(x / 50.0, y / 50.0, 3, seed) - 0.5);
                if (dd > 1.15) continue;
                double a = (dd < 1 ? 0.06 * (1 - dd) : 0) + 0.13 * Math.Exp(-Math.Pow((dd - 0.97) / 0.035, 2));
                Tint(CR, CG, CB, y * W + x, 135, 95, 50, a);
            }
        }
        for (int s = 0; s < 170; s++)
        {
            double fx, fy;
            if (rnd.NextDouble() < 0.4) { fx = rnd.NextDouble() < 0.5 ? rnd.NextDouble() * 130 : W - rnd.NextDouble() * 130; fy = rnd.NextDouble() * H; if (rnd.NextDouble() < 0.5) { double t = fx; fx = rnd.NextDouble() * W; fy = rnd.NextDouble() < 0.5 ? rnd.NextDouble() * 90 : H - rnd.NextDouble() * 90; } }
            else { fx = rnd.NextDouble() * W; fy = rnd.NextDouble() * H; }
            double rad = 1.2 + rnd.NextDouble() * 4, al = 0.12 + rnd.NextDouble() * 0.28;
            for (int y = (int)(fy - rad - 1); y <= fy + rad + 1; y++) for (int x = (int)(fx - rad - 1); x <= fx + rad + 1; x++)
            {
                if (x < 0 || y < 0 || x >= W || y >= H) continue;
                double dd = Math.Sqrt((x - fx) * (x - fx) + (y - fy) * (y - fy)) / rad; if (dd >= 1) continue;
                Tint(CR, CG, CB, y * W + x, 128, 82, 40, al * (1 - dd * dd));
            }
        }
        double[] vc = { W / 4.0, W / 2.0, 3 * W / 4.0 }; double hc = H / 2.0;
        for (int y = 0; y < H; y++) for (int x = 0; x < W; x++)
        {
            int i = y * W + x; double f = 1;
            foreach (double c in vc) f *= Crease(x - c, Fbm(y / 60.0, c, 2, 300));
            f *= Crease(y - hc, Fbm(x / 60.0, 9, 2, 301));
            f *= 1 + 0.035 * (H01(x, y, 77) - 0.5);
            double nx = (x - W / 2.0) / (W / 2.0), ny = (y - H / 2.0) / (H / 2.0);
            f *= 1 - 0.10 * Math.Pow(Math.Sqrt(nx * nx + ny * ny) / 1.414, 2.5);
            CR[i] *= f; CG[i] *= f; CB[i] *= f;
            double e = Math.Min(Math.Min(x, y), Math.Min(W - 1 - x, H - 1 - y)) + 18 * (Fbm(x / 25.0, y / 25.0, 3, 55) - 0.5);
            double burn = 0.55 * Math.Exp(-Math.Max(e, 0) / 10.0) + 0.16 * Math.Exp(-Math.Max(e, 0) / 90.0);
            Tint(CR, CG, CB, i, 86, 52, 24, Cl(burn));
        }
        for (int i = 0; i < N; i++) cpx[i] = Pack(CR[i], CG[i], CB[i]);
        WritePx(cb, cpx);
        cb.Save(dst, ImageFormat.Png); cb.Dispose();
        log.Append("canvas " + W + "x" + H);
        return log.ToString();
    }

    static double Crease(double d, double nz)
    {
        double s = 0.6 + 0.8 * nz;
        return 1 + s * (0.045 * Math.Exp(-(d / 2.0) * (d / 2.0)) - 0.055 * Math.Exp(-((d - 3) / 3.5) * ((d - 3) / 3.5)));
    }
    static void InkPx(double[] R, double[] G, double[] B, int i, double a) { Tint(R, G, B, i, 62, 42, 26, a); }
    static void Tint(double[] R, double[] G, double[] B, int i, int r, int g, int b, double a)
    {
        R[i] = Lerp(R[i], r / 255.0, a); G[i] = Lerp(G[i], g / 255.0, a); B[i] = Lerp(B[i], b / 255.0, a);
    }
    static int CDiff(int a, int b)
    {
        return Math.Abs(((a >> 16) & 255) - ((b >> 16) & 255)) + Math.Abs(((a >> 8) & 255) - ((b >> 8) & 255)) + Math.Abs((a & 255) - (b & 255));
    }

    static void DrawStar(Graphics g, float cx, float cy, float rl, float rs, float ri, Color ink, Color light)
    {
        var dk = new SolidBrush(ink); var lt = new SolidBrush(light); var pn = new Pen(ink, 0.8f);
        for (int pass = 0; pass < 2; pass++)
            for (int i = 0; i < 8; i++)
            {
                bool longPt = i % 2 == 0; if ((pass == 0) != !longPt) continue; // short points first
                double a = (i * 45 - 90) * Math.PI / 180, r = longPt ? rl : rs;
                PointF tip = new PointF(cx + (float)(r * Math.Cos(a)), cy + (float)(r * Math.Sin(a)));
                PointF l = new PointF(cx + (float)(ri * Math.Cos(a - Math.PI / 8)), cy + (float)(ri * Math.Sin(a - Math.PI / 8)));
                PointF rr = new PointF(cx + (float)(ri * Math.Cos(a + Math.PI / 8)), cy + (float)(ri * Math.Sin(a + Math.PI / 8)));
                PointF c = new PointF(cx, cy);
                g.FillPolygon(dk, new[] { c, tip, l }); g.FillPolygon(lt, new[] { c, tip, rr });
                g.DrawPolygon(pn, new[] { c, l, tip, rr });
            }
    }

    // ---------- morphology / distance ----------
    static bool[] Erode(bool[] m, int w, int h, int r) { return Morph(m, w, h, r, true); }
    static bool[] Dilate(bool[] m, int w, int h, int r) { return Morph(m, w, h, r, false); }
    static bool[] Morph(bool[] m, int w, int h, int r, bool erode)
    {
        bool[] t = new bool[m.Length], o = new bool[m.Length];
        for (int y = 0; y < h; y++) for (int x = 0; x < w; x++)
        {
            bool v = erode; for (int d = -r; d <= r; d++) { int xx = Math.Min(w - 1, Math.Max(0, x + d)); bool s = m[y * w + xx]; if (erode) v &= s; else v |= s; }
            t[y * w + x] = v;
        }
        for (int y = 0; y < h; y++) for (int x = 0; x < w; x++)
        {
            bool v = erode; for (int d = -r; d <= r; d++) { int yy = Math.Min(h - 1, Math.Max(0, y + d)); bool s = t[yy * w + x]; if (erode) v &= s; else v |= s; }
            o[y * w + x] = v;
        }
        return o;
    }
    static void RemoveSmall(bool[] m, int w, int h, int minSize)
    {
        int[] lab = new int[m.Length]; var st = new Stack<int>(); var comp = new List<int>(); int id = 0;
        for (int i = 0; i < m.Length; i++)
        {
            if (!m[i] || lab[i] != 0) continue; id++; comp.Clear(); st.Push(i); lab[i] = id;
            while (st.Count > 0)
            {
                int p = st.Pop(); comp.Add(p); int x = p % w, y = p / w;
                if (x > 0 && m[p - 1] && lab[p - 1] == 0) { lab[p - 1] = id; st.Push(p - 1); }
                if (x < w - 1 && m[p + 1] && lab[p + 1] == 0) { lab[p + 1] = id; st.Push(p + 1); }
                if (y > 0 && m[p - w] && lab[p - w] == 0) { lab[p - w] = id; st.Push(p - w); }
                if (y < h - 1 && m[p + w] && lab[p + w] == 0) { lab[p + w] = id; st.Push(p + w); }
            }
            if (comp.Count < minSize) foreach (int p in comp) m[p] = false;
        }
    }
    static double[] Chamfer(bool[] ocean, int w, int h)
    {
        int INF = 1 << 28; int[] d = new int[ocean.Length];
        for (int i = 0; i < d.Length; i++) d[i] = ocean[i] ? INF : 0;
        for (int y = 0; y < h; y++) for (int x = 0; x < w; x++)
        {
            int i = y * w + x; if (d[i] == 0) continue; int v = d[i];
            if (x > 0) v = Math.Min(v, d[i - 1] + 3);
            if (y > 0) { v = Math.Min(v, d[i - w] + 3); if (x > 0) v = Math.Min(v, d[i - w - 1] + 4); if (x < w - 1) v = Math.Min(v, d[i - w + 1] + 4); }
            d[i] = v;
        }
        for (int y = h - 1; y >= 0; y--) for (int x = w - 1; x >= 0; x--)
        {
            int i = y * w + x; if (d[i] == 0) continue; int v = d[i];
            if (x < w - 1) v = Math.Min(v, d[i + 1] + 3);
            if (y < h - 1) { v = Math.Min(v, d[i + w] + 3); if (x < w - 1) v = Math.Min(v, d[i + w + 1] + 4); if (x > 0) v = Math.Min(v, d[i + w - 1] + 4); }
            d[i] = v;
        }
        double[] o = new double[d.Length]; for (int i = 0; i < d.Length; i++) o[i] = d[i] / 3.0; return o;
    }
}

/*
 * Copyright 2015 Google Inc.
 *
 * Use of this source code is governed by a BSD-style license that can be
 * found in the LICENSE file.
 */
import skia.c.sk_types;
import skia.c.sk_canvas;
import skia.c.sk_data;
import skia.c.sk_image;
import skia.c.sk_imageinfo;
import skia.c.sk_paint;
import skia.c.sk_path;
import skia.c.sk_surface;

void main()
{
    sk_surface_t* surface = make_surface(640, 480);
    sk_canvas_t* canvas = sk_surface_get_canvas(surface);
    draw(canvas);
    write_png_file("skia-c-example.png", surface);
    sk_surface_unref(surface);
}

sk_surface_t* make_surface(int w, int h)
{
    sk_imageinfo_t* info = sk_imageinfo_new(
        w, h,
        sk_colortype_t.RGBA_8888_SK_COLORTYPE,
        sk_alphatype_t.PREMUL_SK_ALPHATYPE,
        null);
    scope(exit) sk_imageinfo_delete(info);
    return sk_surface_new_raster(info, null);
}

void write_png_file(string path, sk_surface_t* surface)
{
    import std.file : write;
    sk_image_t* image = sk_surface_new_image_snapshot(surface);
    sk_data_t* data = sk_image_encode(image);
    sk_image_unref(image);
    const void[] bytes = sk_data_get_data(data)[0 .. sk_data_get_size(data)];
    path.write(bytes);
    sk_data_unref(data);
}

void draw(sk_canvas_t* canvas)
{
    sk_paint_t* fill = sk_paint_new();
    scope (exit) sk_paint_delete(fill);
    sk_paint_set_color(fill, sk_color_set_argb(0xFF, 0x00, 0x00, 0xFF));
    sk_canvas_draw_paint(canvas, fill);

    sk_paint_set_color(fill, sk_color_set_argb(0xFF, 0x00, 0xFF, 0xFF));
    sk_rect_t rect = { left: 100, top: 100, right: 540, bottom: 380 };
    sk_canvas_draw_rect(canvas, &rect, fill);

    sk_paint_t* stroke = sk_paint_new();
    scope (exit) sk_paint_delete(stroke);
    sk_paint_set_color(stroke, sk_color_set_argb(0xFF, 0xFF, 0x00, 0x00));
    sk_paint_set_antialias(stroke, true);
    sk_paint_set_stroke(stroke, true);
    sk_paint_set_stroke_width(stroke, 5.0f);

    sk_path_t* path = sk_path_new();
    scope (exit) sk_path_delete(path);
    sk_path_move_to(path, 50.0f, 50.0f);
    sk_path_line_to(path, 590.0f, 50.0f);
    sk_path_cubic_to(path, -490.0f, 50.0f, 1130.0f, 430.0f, 50.0f, 430.0f);
    sk_path_line_to(path, 590.0f, 430.0f);
    sk_canvas_draw_path(canvas, path, stroke);

    sk_paint_set_color(fill, sk_color_set_argb(0x80, 0x00, 0xFF, 0x00));
    sk_rect_t rect2 = { left: 120, top: 120, right: 520, bottom: 360 };
    sk_canvas_draw_oval(canvas, &rect2, fill);
}

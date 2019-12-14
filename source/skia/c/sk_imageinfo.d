/*
 * Copyright 2018 Google Inc.
 *
 * Use of this source code is governed by a BSD-style license that can be
 * found in the LICENSE file.
 */

// EXPERIMENTAL EXPERIMENTAL EXPERIMENTAL EXPERIMENTAL
// DO NOT USE -- FOR INTERNAL TESTING ONLY

module skia.c.sk_imageinfo;

import skia.c.sk_types;

extern (C):
@nogc:
nothrow:

enum sk_colortype_t
{
    UNKNOWN_SK_COLORTYPE = 0,
    RGBA_8888_SK_COLORTYPE = 1,
    BGRA_8888_SK_COLORTYPE = 2,
    ALPHA_8_SK_COLORTYPE = 3,
    GRAY_8_SK_COLORTYPE = 4,
    RGBA_F16_SK_COLORTYPE = 5,
    RGBA_F32_SK_COLORTYPE = 6
}

enum sk_alphatype_t
{
    OPAQUE_SK_ALPHATYPE = 0,
    PREMUL_SK_ALPHATYPE = 1,
    UNPREMUL_SK_ALPHATYPE = 2
}

/**
 *  Allocate a new imageinfo object. If colorspace is not null, it's owner-count will be
 *  incremented automatically.
 */
sk_imageinfo_t* sk_imageinfo_new(
    int width,
    int height,
    sk_colortype_t ct,
    sk_alphatype_t at,
    sk_colorspace_t* cs);

/**
 *  Free the imageinfo object. If it contains a reference to a colorspace, its owner-count will
 *  be decremented automatically.
 */
void sk_imageinfo_delete(sk_imageinfo_t*);

int sk_imageinfo_get_width(const(sk_imageinfo_t)*);
int sk_imageinfo_get_height(const(sk_imageinfo_t)*);
sk_colortype_t sk_imageinfo_get_colortype(const(sk_imageinfo_t)*);
sk_alphatype_t sk_imageinfo_get_alphatype(const(sk_imageinfo_t)*);

/**
 *  Return the colorspace object reference contained in the imageinfo, or null if there is none.
 *  Note: this does not modify the owner-count on the colorspace object. If the caller needs to
 *  use the colorspace beyond the lifetime of the imageinfo, it should manually call
 *  sk_colorspace_ref() (and then call unref() when it is done).
 */
sk_colorspace_t* sk_imageinfo_get_colorspace(const(sk_imageinfo_t)*);


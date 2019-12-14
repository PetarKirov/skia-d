/*
 * Copyright 2018 Google Inc.
 *
 * Use of this source code is governed by a BSD-style license that can be
 * found in the LICENSE file.
 */

// EXPERIMENTAL EXPERIMENTAL EXPERIMENTAL EXPERIMENTAL
// DO NOT USE -- FOR INTERNAL TESTING ONLY

module skia.c.sk_colorspace;

import skia.c.sk_types;

extern (C):
@nogc:
nothrow:

sk_colorspace_t* sk_colorspace_new_srgb();

void sk_colorspace_ref(sk_colorspace_t*);
void sk_colorspace_unref(sk_colorspace_t*);


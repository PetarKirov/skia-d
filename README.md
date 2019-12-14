# D bindings for [Skia][1]

> Skia is an open source 2D graphics library which provides common APIs that
> work across a variety of hardware and software platforms. It serves as the
> graphics engine for Google Chrome and Chrome OS, Android, Mozilla Firefox and
> Firefox OS, and many other products.

## Examples

See [`examples/c-api/example1/source/app.d`](examples/c-api/example1/source/app.d).

## Building Skia

The first `c-api` example was tested by linking libskia.a built with the folloing command:

```sh
bin/gn gen out/Release --args="is_official_build=true skia_use_system_freetype2=false skia_enable_tools=false skia_use_libwebp=false skia_use_lua=false skia_use_dng_sdk=false skia_enable_pdf=false skia_enable_gpu=false skia_use_system_libjpeg_turbo=false skia_use_system_libpng=false skia_use_system_zlib=false"
```

Initial translation done by [DStep][2] via the following command:

```sh
cd skia
dstep \
    --package=skia.c \
    --global-attribute=@nogc \
    --global-attribute=nothrow \
    --space-after-function-name=false \
    -o ../skia-d/source/skia/c/ \
    ./include/c/* \
    -- -I.
mv source/skia/c/include/c/* source/skia/c/ && rm -r source/skia/c/include
```

[1]: https://skia.org/
[2]: https://github.com/jacob-carlborg/dstep

# D bindings for [Skia][1]

> Skia is an open source 2D graphics library which provides common APIs that
> work across a variety of hardware and software platforms. It serves as the
> graphics engine for Google Chrome and Chrome OS, Android, Mozilla Firefox and
> Firefox OS, and many other products.

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

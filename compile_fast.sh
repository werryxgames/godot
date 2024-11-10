#!/usr/bin/sh

dir=$(dirname $0)

scons=pyston-scons

platform=linuxbsd
production=yes
lto=none
debug_symbols=yes
linker=mold

builtin_embree=no
builtin_enet=no
builtin_freetype=no
builtin_graphite=no
builtin_harfbuzz=no
builtin_libogg=no
builtin_libpng=no
builtin_libtheora=no
builtin_libvorbis=no
builtin_libwebp=no
builtin_mbedtls=no
builtin_miniupnpc=no
builtin_pcre2=no
builtin_zlib=no
builtin_zstd=no

builtin_flags=$(cat <<EOF
builtin_embree=$builtin_embree
builtin_enet=$builtin_enet
builtin_freetype=$builtin_freetype
builtin_graphite=$builtin_graphite
builtin_harfbuzz=$builtin_harfbuzz
builtin_libogg=$builtin_libogg
builtin_libpng=$builtin_libpng
builtin_libtheora=$builtin_libtheora
builtin_libvorbis=$builtin_libvorbis
builtin_libwebp=$builtin_libwebp
builtin_mbedtls=$builtin_mbedtls
builtin_miniupnpc=$builtin_miniupnpc
builtin_pcre2=$builtin_pcre2
builtin_zlib=$builtin_zlib
builtin_zstd=$builtin_zstd
EOF
)

flags="-C $dir platform=$platform production=$production lto=$lto debug_symbols=$debug_symbols linker=$linker $builtin_flags"

$scons $flags $*


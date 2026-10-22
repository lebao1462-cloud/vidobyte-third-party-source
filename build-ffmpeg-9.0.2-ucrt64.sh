#!/usr/bin/env bash
# VidoByte 0.3.4: reproduce the custom FFmpeg 9.0.2 command-line binaries.
# Run this in MSYS2 UCRT64 on Windows x64; archive ffmpeg-9.0.2.tar.xz
# is available at https://ffmpeg.org/releases/ffmpeg-9.0.2.tar.xz.
#
# Install build dependencies using pacman:
#   pacman -S --needed make diffutils pkgconf \
#     mingw-w64-ucrt-x86_64-gcc mingw-w64-ucrt-x86_64-nasm \
#     mingw-w64-ucrt-x86_64-pkgconf \
#     mingw-w64-ucrt-x86_64-svt-av1 mingw-w64-ucrt-x86_64-dav1d
#
# Extract upstream archive as ./ffmpeg-9.0.2 before running this script.
set -euo pipefail

ROOT="$(cd "$(dirname "$0")" && pwd)"
SRC="$ROOT/ffmpeg-9.0.2"
BUILD="$ROOT/ffmpeg-build"
PREFIX="$ROOT/ffmpeg-install"

test -f "$SRC/configure" || { echo "Missing $SRC/configure" >&2; exit 1; }
mkdir -p "$BUILD" "$PREFIX"
cd "$BUILD"

"$SRC/configure" \
  --prefix="$PREFIX" \
  --arch=x86_64 --target-os=mingw32 \
  --disable-gpl --disable-nonfree --enable-version3 \
  --disable-libopenh264 --disable-libx264 --disable-libx265 \
  --disable-autodetect \
  --enable-libsvtav1 --enable-libdav1d \
  --enable-mediafoundation --enable-d3d11va \
  --disable-ffplay --disable-doc --disable-debug \
  --enable-static --disable-shared

make -j4
make install

"$PREFIX/bin/ffmpeg.exe" -hide_banner -version
"$PREFIX/bin/ffmpeg.exe" -hide_banner -encoders
"$PREFIX/bin/ffmpeg.exe" -hide_banner -decoders

# Check output for h264_mf, libsvtav1, libdav1d, and absence of libopenh264.
# Binary may rely on MSYS2 UCRT64 runtime and codec DLLs; ensure appropriate
# DLLs and their licenses are redistributed with the executable.

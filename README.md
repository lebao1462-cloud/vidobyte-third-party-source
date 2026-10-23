# VidoByte Smart Video Compressor — Third-Party Source

This public repository documents the third-party open-source components included in the Windows x64 **VidoByte 0.3.4, 0.3.5 and 0.3.6** *release candidates*. It is **not** the proprietary VidoByte application source repository.

> **Release status:** Windows 10 and Windows 11 installed-MSIX GUI QA and local Windows App Certification Kit validation have passed, but the application is **not yet cleared for public/commercial distribution**. Third-party redistribution requirements and codec patent rights still need final review.

## FFmpeg 9.0.2

VidoByte invokes separate `ffmpeg.exe` and `ffprobe.exe` command-line programs for local processing.

- [Upstream FFmpeg 9.0.2 source archive](https://ffmpeg.org/releases/ffmpeg-9.0.2.tar.xz)
- [FFmpeg legal and license information](https://ffmpeg.org/legal.html)
- [Windows UCRT64 build instructions for this candidate](build-ffmpeg-9.0.2-ucrt64.sh)

The FFmpeg build is configured **without** OpenH264, x264, x265 or GPL options. Windows Media Foundation (`h264_mf`) is used for H.264 encoding; `libsvtav1` is used for AV1 encoding and `libdav1d` for AV1 decoding.

To inspect the version and exact configure flags of a distributed binary, run `ffmpeg.exe -version`.

## Dependencies

| Component | Candidate version | Source / licensing |
| --- | --- | --- |
| FFmpeg | 9.0.2 | [Source](https://ffmpeg.org/releases/ffmpeg-9.0.2.tar.xz) · LGPLv3 configuration |
| dav1d | 1.5.4 | [VideoLAN dav1d](https://code.videolan.org/videolan/dav1d) · BSD-style terms and patent notice |
| SVT-AV1 | 4.2.0 | [AOMediaCodec SVT-AV1](https://gitlab.com/AOMediaCodec/SVT-AV1) · BSD-style terms and patent notice |
| MinGW-w64 GCC runtime | GCC 16.2 toolchain | [MSYS2 packages](https://packages.msys2.org/) · GPL and applicable GCC runtime exceptions |
| Winpthreads | MSYS2 UCRT64 | [MinGW-w64](https://www.mingw-w64.org/) · separate redistribution terms |

The app installation includes corresponding third-party license notices in its `ThirdParty/` directory. This repository contains the reproducible build recipe; the publicly posted source-offer bundle is linked below. The same custom FFmpeg 9.0.2 binaries are used across VidoByte 0.3.4–0.3.6. Version 0.3.5 changed the application's stream preservation behavior; version 0.3.6 adds an offline self-diagnostic. Neither changes the bundled FFmpeg build.

## Third-party source bundle

The prepared source-offer archive is available publicly:

[Download VidoByte 0.3.4/0.3.5 third-party source-offer ZIP](VidoByte_0.3.4_ThirdParty_Source_Offer.zip) (approximately 12 MB).

It contains the upstream FFmpeg source archive, Windows build script, and selected license material. The complete corresponding-source and transitive dependency obligations still require review. Merely linking upstream sources is not necessarily sufficient.

## Version-pinned dependency sources (for audit)

The redistributed release-candidate binaries use these precise upstream versions. These links supplement, but do not replace, the existing source-offer archive or a complete corresponding-source review:

- **dav1d 1.5.4**: [VideoLAN source tarball](https://downloads.videolan.org/pub/videolan/dav1d/1.5.4/dav1d-1.5.4.tar.xz) and [upstream SHA-256](https://downloads.videolan.org/pub/videolan/dav1d/1.5.4/dav1d-1.5.4.tar.xz.sha256).
- **SVT-AV1 4.2.0**: [GitLab tag v4.2.0](https://gitlab.com/AOMediaCodec/SVT-AV1/-/tags/v4.2.0) and [source tarball](https://gitlab.com/AOMediaCodec/SVT-AV1/-/archive/v4.2.0/SVT-AV1-v4.2.0.tar.gz).
- **MinGW-w64 winpthreads 14.0.0.r495.g63ebe6cdb-2**: [MSYS2 source-only release](https://mirror.msys2.org/mingw/sources/mingw-w64-winpthreads-14.0.0.r495.g63ebe6cdb-2.src.tar.zst). This package may contain a build recipe that fetches further upstream sources.
- **GCC libgcc/libstdc++ 16.2.0-6**: [MSYS2 exact-version source-only tarball](https://mirror.msys2.org/mingw/sources/mingw-w64-gcc-16.2.0-6.src.tar.zst), [MSYS2 libgcc 16.2.0-6 binary/license manifest](https://packages.msys2.org/packages/mingw-w64-ucrt-x86_64-libgcc) and [GCC Runtime Library Exception 3.1](https://www.gnu.org/licenses/gcc-exception-3.1.html). The source-only package may reference separate GCC upstream tarballs; its completeness for this build remains under review.

**Audit note (2026-10-23):** The public `VidoByte_0.3.4_ThirdParty_Source_Offer.zip` currently contains the FFmpeg tarball, a build script and selected license texts, **not** all of the source archives linked above. A separate local supplemental draft has been prepared for review. Full dependency attribution, version matching, LGPL/GCC runtime obligations and patent rights remain to be confirmed prior to public/commercial distribution.

## License and patents

Open-source software licensing is distinct from codec patent licensing. Using Windows Media Foundation and removing OpenH264 **does not by itself establish commercial H.264 patent clearance** in every market. Verify patent rights and third-party license obligations before distributing commercially.

For source/material requests, contact **lebao1462@gmail.com**.

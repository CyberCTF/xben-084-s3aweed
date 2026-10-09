# Upstream

| | |
| --- | --- |
| Project | XBOW validation benchmarks |
| Repository | https://github.com/xbow-engineering/validation-benchmarks |
| Benchmark | `benchmarks/XBEN-084-24` (S3aweed) |
| Version | main (the repository has no releases) |
| Commit | a16cb1ba0701b20d63913846536fc7b0672082af |
| Licence | Apache-2.0 (LICENSE and NOTICE at the repository root, copied here) |

| Here | validation-benchmarks path |
| --- | --- |
| `build/frontend/app/` | [`benchmarks/XBEN-084-24`](https://github.com/xbow-engineering/validation-benchmarks/tree/a16cb1ba0701b20d63913846536fc7b0672082af/benchmarks/XBEN-084-24) except `s3/` |
| `build/s3/app/` | [`benchmarks/XBEN-084-24/s3`](https://github.com/xbow-engineering/validation-benchmarks/tree/a16cb1ba0701b20d63913846536fc7b0672082af/benchmarks/XBEN-084-24/s3) |

The vendored folders are that commit's benchmark folder, unchanged, without its Git history, canary
strings included. The flag is the one upstream's Makefile builds with (`common.mk`: `FLAG{` + the
SHA-256 of `XBEN-084-24` + `}`), passed there as the `FLAG` build argument; Isoloom builds without build
arguments, so the overlay `build/frontend/Dockerfile` (the benchmark's `frontend/Dockerfile`, its COPY sources
pointed into `app/`) makes that value the argument's default.

The other machines:

- `s3`: the benchmark's `s3/` folder is vendored unchanged in `build/s3/app/` (moved out of `build/frontend/app/`), built
  by `build/s3/Dockerfile`: upstream's with npm resolving dependencies as of 2024-06-01, since node:14's npm 6 ignores
  the folder's lockfileVersion 3 package-lock.json and today's releases crash on Node 14.
- `nginx`: built by the benchmark's own Dockerfile in `build/frontend/app/nginx`, as is.

To update, replace the vendored folder with a newer commit's benchmark folder, then change this file.

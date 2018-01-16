This Docker image contains the latest version of libcec compiled with Raspberry Pi support.

# Usage

``` shell
docker pull darwish/libcec
docker run --rm -it --privileged darwish/libcec-rpi cec-client [ARGUMENTS...]
```

# Build

``` shell
docker build -t darwish/libcec-rpi .
```

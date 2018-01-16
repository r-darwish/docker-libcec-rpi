FROM resin/rpi-raspbian

RUN apt-get update && apt-get install build-essential git cmake libudev-dev libxrandr-dev python-dev swig pkg-config libraspberrypi0 libraspberrypi-dev libraspberrypi-doc libraspberrypi-bin
RUN git clone https://github.com/Pulse-Eight/libcec.git
WORKDIR /libcec
RUN apt-get purge swig2.0
RUN git submodule update --init
WORKDIR src/platform
RUN mkdir build && cd build && cmake .. && make -j4 && make install
WORKDIR /libcec
run mkdir build && cd build && cmake cmake -DRPI_INCLUDE_DIR=/opt/vc/include -DRPI_LIB_DIR=/opt/vc/lib -DCMAKE_INSTALL_PREFIX=/opt/libcec .. && make -j4 && make install
ENV LD_LIBRARY_PATH="/opt/libcec/lib"
ENV PATH="/opt/libcec/bin:${PATH}"

FROM phusion/baseimage:latest
MAINTAINER Jonathan Ben-Joseph <jbenjos.work@gmail.com>
CMD caffe

RUN apt-get update && apt-get -y dist-upgrade
RUN apt-get -y install bc git python-dev libgflags-dev libprotobuf-dev libleveldb-dev libsnappy-dev libopencv-dev libboost-all-dev libhdf5-serial-dev protobuf-compiler build-essential libgoogle-glog-dev libopenblas-dev liblmdb-dev libdc1394-22-dev

RUN git clone https://github.com/BVLC/caffe.git src-caffe
RUN cd src-caffe && cp Makefile.config.example Makefile.config && sed -i -e 's/:= atlas/:= open/g' -e 's/# CPU_/CPU_/g' Makefile.config && make
RUN ln -s /src-caffe/.build_release /caffe
ENV PATH /caffe/tools:$PATH

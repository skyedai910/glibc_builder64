#FROM phusion/baseimage:master-amd64
FROM skysider/glibc_builder64:2.19

RUN apt-get update && \
    apt-get install -y \
    wget \
    gcc \
    make \
    gawk \
    libgetopt-argvfile-perl \
    bison && \
    rm -rf /var/lib/apt/list/*

ARG GLIBC_VERSION

COPY build_glibc.sh /root/

RUN chmod +x /root/build_glibc.sh && \
    /root/build_glibc.sh

RUN apt-get remove -y \
    wget \
    gcc \
    make \
    gawk \
    libgetopt-argvfile-perl \
    bison && \
    apt autoremove -y

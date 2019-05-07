FROM ubuntu:18.04

ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8


RUN apt-get --yes -qq update \
 && apt-get --yes -qq upgrade \
 && apt-get --yes -qq install \
                      bzip2 \
                      cmake \
                      cpio \
                      curl \
                      g++ \
                      gcc \
                      gfortran \
                      git \
                      gosu \
                      libblas-dev \
                      liblapack-dev \
                      libopenmpi-dev \
                      openmpi-bin \
                      python3-dev \
                      python3-pip \
                      virtualenv \
                      wget \
                      zlib1g-dev \
                      vim       \
                      htop      \
 && apt-get --yes -qq clean \
 && rm -rf /var/lib/apt/lists/*

COPY basic.vim /opt/docker/bin/basic.vim

COPY commands /opt/docker/bin/commands
RUN /opt/docker/bin/commands

COPY entrypoint_source /opt/docker/bin/entrypoint_source

COPY entrypoint /opt/docker/bin/entrypoint

ENTRYPOINT [ "/opt/docker/bin/tini", "--", "/opt/docker/bin/entrypoint" ]


CMD [ "/bin/bash" ]

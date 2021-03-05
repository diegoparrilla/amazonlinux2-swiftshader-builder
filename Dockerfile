# ---- AMAZON LINUX V2 ----
FROM amazonlinux:2 AS OS

# ---- DEPENDENCIES ----
FROM OS AS dependencies
USER root
RUN yum install -y python3 openssl-devel openssh-clients git wget gzip tar libX11-devel libXt-devel libXext-devel
RUN yum groupinstall -y 'Development Tools'

# ---- SWIFTSHADER ----
FROM dependencies as swiftshader
RUN mkdir -p ~/.ssh/ && ssh-keyscan -t rsa github.com > ~/.ssh/known_hosts

# ---- CMAKE ----
FROM swiftshader as cmake
RUN wget -O cmake-3.19.6.tar.gz https://github.com/Kitware/CMake/releases/download/v3.19.6/cmake-3.19.6.tar.gz
RUN tar xvf cmake-3.19.6.tar.gz && cd cmake-3.19.6 && ./bootstrap && make && make install

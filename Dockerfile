# docker build -t ubuntu:ezolfaz .

FROM ubuntu:25.04

# Avoid warnings by switching to noninteractive
ENV DEBIAN_FRONTEND=noninteractive

# Configure apt and install packages
RUN apt-get update \
    && apt-get -y install --no-install-recommends apt-utils dialog 2>&1 \
    && apt-get -y install sudo procps lsb-release aptitude bash-completion \
    build-essential cmake cppcheck valgrind clang gcc g++ libboost-dev \
    vim mc htop neofetch luarocks \
    git tmux unzip wget curl npm nodejs openjdk-21-jdk-headless

# Switch back to dialog for any ad-hoc use of apt-get
ENV DEBIAN_FRONTEND=

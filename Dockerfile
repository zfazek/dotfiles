# docker build -t ubuntu .

FROM ubuntu:latest

# Avoid warnings by switching to noninteractive
ENV DEBIAN_FRONTEND=noninteractive

# Or your actual UID, GID on Linux if not the default 1000
ARG USERNAME=zoli
# ARG USER_UID=1000
# ARG USER_GID=$USER_UID

# Configure apt and install packages
RUN apt-get update \
    && apt-get -y install --no-install-recommends apt-utils dialog 2>&1 \
    && apt-get -y install sudo procps lsb-release aptitude bash-completion \
    build-essential cmake cppcheck valgrind clang g++ libboost-dev \
    vim exuberant-ctags mc htop \
    libglew-dev libglfw3-dev libglm-dev libfreetype6-dev \
    nvim python3-nvim python3-dev \
    && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
    && chmod 0440 /etc/sudoers.d/$USERNAME

# Switch back to dialog for any ad-hoc use of apt-get
ENV DEBIAN_FRONTEND=

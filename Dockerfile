FROM ubuntu:22.04
ARG USER_NAME=kicad
ARG USER_UID=1000
ARG USER_GID=$USER_UID

ENV DEBIAN_FRONTEND noninteractive

RUN --mount=type=cache,target=/var/cache/apt \
    apt-get update \
    && apt-get install -y \
    git \
    python3 \
    python3-pip \
    shared-mime-info \
    software-properties-common \
    sudo

RUN --mount=type=cache,target=/var/cache/apt \
    add-apt-repository --yes ppa:kicad/kicad-7.0-releases \
    && apt update \
    && apt install -y --no-install-recommends kicad

#RUN --mount=type=cache,target=/var/cache/apt \
#    apt install -y python3-pip \
#    && pip3 install --user git+https://github.com/INTI-CMNB/KiBot.git

RUN apt-get autoremove -y \
    && rm -rf /var/lib/apt/lists/*

RUN groupadd --gid $USER_GID $USER_NAME \
    && useradd --uid $USER_UID --gid $USER_GID -m $USER_NAME \
    && usermod -aG sudo $USER_NAME \
    && echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

USER $USER_NAME

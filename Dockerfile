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
    sudo \
    xrdp \
    xauth \
    xvfb \
    xfce4 \
    xfce4-goodies

RUN --mount=type=cache,target=/var/cache/apt \
    add-apt-repository --yes ppa:kicad/kicad-7.0-releases \
    && apt update \
    && apt install -y --no-install-recommends kicad

#RUN --mount=type=cache,target=/var/cache/apt \
#    apt install -y python3-pip \
#    && pip3 install --user git+https://github.com/INTI-CMNB/KiBot.git


RUN --mount=type=cache,target=/var/cache/apt \
    apt-get install -y \
    xorgxrdp

RUN apt-get autoremove -y \
    && rm -rf /var/lib/apt/lists/*

RUN groupadd --gid $USER_GID $USER_NAME \
    && useradd --uid $USER_UID --gid $USER_GID -m $USER_NAME \
    && usermod -aG sudo $USER_NAME \
    && echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

COPY ./build/ubuntu-run.sh /usr/bin/
RUN mv /usr/bin/ubuntu-run.sh /usr/bin/run.sh
RUN chmod +x /usr/bin/run.sh

# https://github.com/danielguerra69/ubuntu-xrdp/blob/master/Dockerfile
RUN mkdir /var/run/dbus && \
    cp /etc/X11/xrdp/xorg.conf /etc/X11 && \
    sed -i "s/console/anybody/g" /etc/X11/Xwrapper.config && \
    sed -i "s/xrdp\/xorg/xorg/g" /etc/xrdp/sesman.ini && \
    echo "xfce4-session" >> /etc/skel/.Xsession


# Docker config
EXPOSE 3389
ENTRYPOINT ["/usr/bin/run.sh"]

# USER $USER_NAME

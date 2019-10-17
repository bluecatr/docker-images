FROM sdm.sliic.lenovo.com:5000/ubuntu16-ssh
MAINTAINER huyd

RUN sed -i 's#http://archive.ubuntu.com/#http://mirrors.aliyun.com/#' /etc/apt/sources.list \
    && apt update \
    && apt install -y vnc4server gnome-panel gnome-settings-daemon gnome-terminal light-themes libglib2.0-bin xterm \
    && apt clean && rm -rf /var/lib/apt/lists/* \
    && mkdir -p /usr/X11R6/lib/X11 \
    && ln -s /usr/share/fonts/X11 /usr/X11R6/lib/X11/fonts \
    && echo "X11UseLocalhost no" >> /etc/ssh/sshd_config \
    && echo "AddressFamily inet" >> /etc/ssh/sshd_config

ADD ./xstartup /root/.vnc/xstartup

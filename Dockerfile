FROM bluecatr/ubuntu16-ssh:16
MAINTAINER huyd

RUN sed -i 's#http://archive.ubuntu.com/#http://mirrors.aliyun.com/#' /etc/apt/sources.list \
    && apt update \
    && apt install -y vnc4server gnome-panel gnome-settings-daemon gnome-terminal light-themes libglib2.0-bin xterm \
    && apt clean && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /usr/X11R6/lib/X11 \
    && ln -s /usr/share/fonts/X11 /usr/X11R6/lib/X11/fonts \
    && echo "X11UseLocalhost no" >> /etc/ssh/sshd_config \
    && echo "AddressFamily inet" >> /etc/ssh/sshd_config

#echo -e 'passw0rd\npassw0rd\n'|vncpasswd

ADD ./vncserver.service /etc/systemd/system/vncserver.service
ADD ./passwd /root/.vnc/passwd
ADD ./xstartup /root/.vnc/xstartup

RUN chmod 755 /root/.vnc/xstartup \
    && systemctl enable vncserver

EXPOSE 5901

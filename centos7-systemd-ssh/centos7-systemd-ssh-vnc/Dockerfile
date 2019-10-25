FROM bluecatr/centos7-systemd-ssh:7
MAINTAINER huyd

RUN yum install -y gnome-classic-session gnome-terminal nautilus-open-terminal control-center liberation-mono-fonts tigervnc-server \
    && yum clean all && rm -rf /var/cache/yum/* \
    && unlink /etc/systemd/system/default.target \
    && ln -sf /lib/systemd/system/graphical.target /etc/systemd/system/default.target \
    && cp /lib/systemd/system/vncserver@.service /etc/systemd/system/vncserver@:1.service \
    && sed -ri 's/^ExecStart=.*/ExecStart=\/usr\/sbin\/runuser -l root -c "\/usr\/bin\/vncserver %i"/g' /etc/systemd/system/vncserver@:1.service \
    && sed -ri 's/^PIDFile=.*/PIDFile=\/root\/.vnc\/%H%i.pid/g' /etc/systemd/system/vncserver@:1.service \
    && echo -e "passw0rd\npassw0rd" | vncpasswd \
    && systemctl enable vncserver@:1

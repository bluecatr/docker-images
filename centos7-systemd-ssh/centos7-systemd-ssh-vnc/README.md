# centos7-systemd-ssh-vnc
Docker image: [centos7-systemd-ssh-vnc](https://hub.docker.com/r/bluecatr/centos7-systemd-ssh-vnc)

Enable systemctl and sshd root:passw0rd@, vnc pasword: passw0rd

docker run --privileged -d -p 5901:5901 -p 22:22 -v /sys/fs/cgroup:/sys/fs/cgroup:ro bluecatr/centos7-systemd-ssh-vnc

## VIM 中文支持
修改/etc/vimrc文件，在该文件尾上添加下面四行代码：
```
set fileencodings=utf-8,gb2312,gbk,gb18030
set termencoding=utf-8
set fileformats=unix
set encoding=prc
```

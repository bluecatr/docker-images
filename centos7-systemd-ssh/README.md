# centos7-systemd-ssh
Docker image: [centos7-systemd-ssh](https://hub.docker.com/r/bluecatr/centos7-systemd-ssh)

Enable systemctl and sshd root:passw0rd@

docker run --privileged -d -v /sys/fs/cgroup:/sys/fs/cgroup:ro bluecatr/centos7-systemd-ssh

## VIM 中文支持
修改/etc/vimrc文件，在该文件尾上添加下面四行代码：
```
set fileencodings=utf-8,gb2312,gbk,gb18030
set termencoding=utf-8
set fileformats=unix
set encoding=prc
```

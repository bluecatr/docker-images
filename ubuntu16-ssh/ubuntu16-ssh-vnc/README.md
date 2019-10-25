# ubuntu16-ssh-vnc
Docker image: [ubuntu16-ssh-vnc](https://hub.docker.com/r/bluecatr/ubuntu16-ssh-vnc)

Add VNC Server, enable SSH Server for Ubuntu 16.04

Enable sshd root:passw0rd@

docker run -d -p 22001:22 -p 59001:5901 bluecatr/ubuntu16-ssh-vnc

第一次启动需要ssh登录进去，启动vncserver并设置初始密码

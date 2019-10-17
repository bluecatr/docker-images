# centos7-systemd-ssh
Docker image: [centos7-systemd-ssh](https://cloud.docker.com/u/bluecatr/repository/docker/bluecatr/centos7-systemd-ssh)

Enable systemctl and sshd root:passw0rd@

docker run --privileged -d -v /sys/fs/cgroup:/sys/fs/cgroup:ro bluecatr/centos7-systemd-ssh

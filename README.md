[![Docker Cloud Automated build](https://img.shields.io/docker/cloud/automated/wrboyce/utils)](https://hub.docker.com/r/wrboyce/utils)

## Usage

All images should be published to docker hub built for `amd64`, `arm64`, and `arm/v7`. If a desired
architecture is not available, then the `make gen` command can be used to generate some one-line
commands to have docker build the image locally. This also seems to be necessary sometimes even if
there is an appropriate build available. As it stands I'm not sure why.

## Examples

### ctop

```
docker run --rm -it -v /var/run/docker.sock:/var/run/docker.sock:ro wrboyce/utils:ctop
```

### htop

```
docker run --rm -it --pid=host wrboyce/utils:htop
```

### iperf3

run an `iperf3` server:

```
docker run --rm -i --net=host wrboyce/utils:iperf3 -s
```

run an `iperf3` test:

```
docker run --rm -i wrboyce/utils:iperf3 -s $server
```

### jq

```
docker run --rm -i wrboyce/utils:jq </path/to/file.json
```

### nmap

scan all ports on the host's localhost interface:

```
docker run --rm -it --pid=host wrboyce/utils:nmap -p- -T5 localhost
```

### strace

`strace` a container's init process:

```
docker run --rm -it --pid=container:$id --cap-add sys_ptrace wrboyce/utils:strace
```

`strace` a process on the host:

```
docker run --rm -it --pid=host --cap-add sys_ptrace wrboyce/utils:strace -p $pid
```

### tcpdump / tshark

`tcpdump` "any" interface on the host:

```
docker run --rm -it --net=host --cap-add sys_ptrace wrboyce/utils:tcpdump
```

`tshark` a container's traffic on eth0:

```
docker run --rm -it --net=container:$id wrboyce/utils:tshark -i eth0
```

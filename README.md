[![Docker Cloud Automated build](https://img.shields.io/docker/cloud/automated/wrboyce/utils)](https://hub.docker.com/r/wrboyce/utils)

## Usage

### ctop

```
docker run --rm -it -v /var/run/docker.sock:/var/run/docker.sock:ro wrboyce/utils:ctop
```

### htop

```
docker run --rm -it --pid=host wrboyce/utils:htop
```

### jq

```
docker run --rm -i wrboyce/utils:jq </path/to/file.json
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

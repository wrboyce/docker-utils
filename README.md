[![Docker Cloud Automated build](https://img.shields.io/docker/cloud/automated/wrboyce/utils)](https://hub.docker.com/r/wrboyce/utils)

## Usage

### htop

```
docker run --rm -it --pid=host wrboyce/utils:htop
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

### tcpdump

`tcpdump` "any" interface on the host:

```
docker run --rm -it --net=host --cap-add sys_ptrace wrboyce/utils:tcpdump
```

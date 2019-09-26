# Docker Utils

## Usage

All images should be published to docker hub built for `amd64`, `arm64`, and `arm/v7`. If a desired
architecture is not available, then the `make gen` command can be used to generate some one-line
commands to have docker build the image locally. 

## Examples

### bandwhich

monitor bandwhich usage include per-process, per-connection, and per-host views:

```
docker run --rm -it --net=host --pid=host --privileged wrboyce/utils:bandwhich
```

### bwm-ng

monitor bandwidth usage on all host interfaces:

```
docker run --rm -it --net=host wrboyce/utils:bwm-ng
```

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

pretty print a json file:

```
docker run --rm -i wrboyce/utils:jq -C </path/to/file.json
```

### lsof

list all open sockets on host:

```
docker run --rm -it -v /proc:/proc --net=host --privileged wrboyce/utils:lsof -i
```

### nmap

scan all ports on the host's localhost interface:

```
docker run --rm -it --net=host wrboyce/utils:nmap -p- -T5 localhost
```

### ntop

the default `ntop` password is 'admin', and the default port is 8888.

```
docker run --rm -it --net=host wrboyce/utils:ntop
```

### ntpq

show ntp peers status:

```
docker run --rm -it wrboyce/utils:ntpq -c peers 10.1.1.1
```

### rq

convert a toml file to json:

```
docker run --rm -i wrboyce/utils:rq --input-toml --output-json </path/to/file.json
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

dockerfiles-centos-squid
=========================

## Build

```
# docker build --rm -t <username>/squid  https://github.com/greymd/dockerfiles.git#:squid/centos7
```

## Usage

To run

```
# docker run -d -p 3128:3128 <username>/squid
```

## Build

### From Dockerhub

```
# docker pull greymd/cureutils
```

### From Github
```
# docker build -t greymd/cureutils https://github.com/greymd/dockerfiles.git#:cureutils/debian
```

### Add those lines to `.bashrc`

```
cure () {
    [ -t 0 ] && T="t" || T=""
    docker run -i$T --rm greymd/cureutils cure $@
}
```

## Use

Usage is [here](https://github.com/greymd/cureutils).

### `cure girls`
```
# cure girls
美墨なぎさ
雪城ほのか
九条ひかり
...
```

### `cure girls`
```
# echo キュア{ハート,ダイヤ,エース,スペード} | xargs -n 1 | cure grep
キュアハート
キュアエース
```

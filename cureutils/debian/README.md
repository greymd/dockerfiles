## Build

```
# docker build -t cureutils https://github.com/greymd/dockerfiles.git#:cureutils/debian
```

### Add this line to `.bashrc`

```
alias cure='docker run -i --rm cureutils cure'
```

## Use

```
# cure girls
美墨なぎさ
雪城ほのか
九条ひかり
...
```

```
# echo キュア{ハート,ダイヤ,エース,スペード} | xargs -n 1 | cure grep
キュアハート
キュアエース
```

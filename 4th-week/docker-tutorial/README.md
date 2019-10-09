## dockerの動かし方

```
$ docker run debian echo "hello docker"
# ↑のURL: https://github.com/debuerreotype/docker-debian-artifacts/blob/74e1a3304401c2eb9c6624ae1056d0a438c15189/buster/Dockerfile
# container削除
$ docker rm <container id>
# container名前をつけて実行
$ docker run --name hello-docker debian echo "hello docker"
# 既存のコンテナを実行(docker ps -a で確認)
$ docker start hello-docker
# 自動でdockerhubからimageを取得してくれる
$ docker pull ruby:2.5.6
# docker imageが入っていることを確認
$ docker images | grep 2.5.6
# imageからcontainerを立ち上げる -itは標準入出力を行う
$ docker run -it ruby:2.5.6
# 毎回毎回、立ち上げるとcontainerが出てくるので削除する
$ docker run --rm ruby:2.5.6
# コンテナを動かすだけの場合はstart
$ docker start <container id or container name>
# dockerのコンテナを止める
$ docker stop <container id or container name>
# containerにあるbashを動かす
$ docker exec -it <container id or container name> /bin/bash
# dockerに入った後でvimインストール
$ apt-get update
$ apt-get install vim
# ファイルを作って動かしてみる
$ vim hello.rb 
# p "hello docker"と記載して実行する。
# レイヤ構造
# vimをインストールしたコマンドを追加し、イメージ化
$ docker build -t add-vim-ruby25 .
# imageが作成されたか、確認
$ docker images
# レイヤー調査
$ docker history add-vim-ruby25
# コンテナ実行してみる
$ docker run add-vim-ruby25
```

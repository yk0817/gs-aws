# dockerの動かし方

## 基礎知識
- imageとは？
  dockerを実行する部分のファイル
  今回でいうと、ruby実行環境など
- レイヤとは？

- コンテナとは？
  - ひらたく言うと、実行環境
  - docker desktopにはエンジンが積まれている
  - https://www.docker.com/products/docker-desktop

- 詳しめにわかる教材
  - https://www.slideshare.net/zembutsu/docker-images-containers-and-lifecycle

## 実際に動かしてみる

### イメージの取得

- dockerhub（docker版のGithubみたいなもの）
  - https://hub.docker.com/_/ruby にあるruby2.5.6を用いる

```
# 自動でdockerhubからimageを取得してくれる
$ docker pull ruby:2.5.6
# docker imageが入っていることを確認
$ docker images | grep 2.5.6
# imageからコンテナを立ち上げる
$ docker run --name ruby25 <image名 or image_id> 
# バックグラウンドで動かす
$ docker start -ai <container id or container name>
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

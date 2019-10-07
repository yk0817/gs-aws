# docker-sinatra

## docker-sinatraの動かし方

```
# dockerのイメージを作成
# docker containerのプロセスを見る
$ docker ps
# イメージを作成
$ docker build -t docker-sinatra .
# docker imageがあることを確認
$ docker images | grep docker-sinatra
$  docker run -p 4567:4567 --name sinatra-cotainer docker-sinatra
# 一回ストップすると、containerが残っていることがわかる。
# 再開するには以下のコマンドを叩く
$ docker start sinatra-cotainer
# docker psで動いているのがわかる
$ docker stop sinatra-cotainer
```

## Dockerfileの見方
FROM
↑今回は以下のディレクトリにあるDockerfileを使っている
https://hub.docker.com/_/ruby

## ECR
```
# docker ECRを作成する流れ (profileを利用していない人は削除して実行してください)
# コンソールでもOK
$ aws ecr create-repository --repository-name docker-sinatra-deploy --profile try_aws_func
$ aws ecr get-login --no-include-email --region ap-northeast-1 --profile try_aws_func | pbcopy
# ペーストしdockerloginを行う。
# gs_aws/4th-week/docker-sinatra上で
$ docker build -t docker-sinatra-deploy .
$ docker tag docker-sinatra-deploy:latest <account_id>.dkr.ecr.ap-northeast-1.amazonaws.com/docker-sinatra
# ECRにpush
$ docker push <account_id>.dkr.ecr.ap-northeast-1.amazonaws.com/docker-sinatra:latest 
```


# dockerの動かし方

## チュートリアル
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

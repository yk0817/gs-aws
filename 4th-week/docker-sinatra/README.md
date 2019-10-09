# dockerの動かし方

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
$ docker run -p 4567:4567 --name sinatra-cotainer docker-sinatra
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

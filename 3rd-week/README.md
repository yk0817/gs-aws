# 3週目

## 個人製作発表

## terraform

```
# version管理インストール
$ brew install tfenv
# terraformのインストール
$ brew install terraform
# terraform versionリスト
$ tfenv list-remote
$ tfenv install 0.11.14
$ tfenv list #0.11.14なら成功
```

## サーバーレスデプロイについて

- 本来はサーバーレス用デプロイ用ツールを使ったほうが良い
  - https://qiita.com/os1ma/items/c4b2c8b27e01857a34f9
- 理屈としては本来的にはterraformは構成管理(iam、EC2など)をするものでプログラム管理(gitみたいに前に戻すことも出来ない)には適さない
  - https://tech.recruit-mp.co.jp/infrastructure/post-16931/

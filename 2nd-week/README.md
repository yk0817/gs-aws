# 第二週目

## aws-cli 
### cli実習

```
# aws-cliをインストールしておく
$ aws configure
# 以下のようなコマンドが出るので入力
AWS Access Key ID [none]: [csvダウンロードした access_key]
AWS Secret Access Key [none]: [csvダウンロードした secret_key]
Default region name [none]: ap-northeast-1
Default output format [none]:json
```

### aws-cliから lambdaを実行してみる

[https://docs.aws.amazon.com/cli/latest/reference/lambda/invoke.html]("参考")

```
# 実行方法は以下の通り
$ aws lambda invoke --invocation-type Event \
$ --profile try_aws_func \
$ --function-name lambda_handler \
$ --region ap-northeast-1 \
$   /tmp/func.log
```

## a3rt
[ここ](/a3rt-tutorial/README.md) を参照

## sdkの実行
[ここ](/aws-sdk/README.md)を参照

## s3との連携
[ここ](/s3-lambda/README.md)を参照

## api-gateway
[ここ](/api-gateway/README.md) を参照

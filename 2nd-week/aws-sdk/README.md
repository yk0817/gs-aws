# awsをコンソール以外で実行してみる

## aws-cliを使ってみる

### 実行方法

```
$ aws lambda invoke --function-name \
$   --function-name my-function  --invocation-type Event
```

## aws-sdkを使ってみる

### 実行方法

```
$ bundle install
$ bundle exec ruby lambda_from_ruby.rb
```


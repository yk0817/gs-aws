## s3 bucket作成コマンド

```
# bucket名の名前は自分の名前に置き換える
aws s3api create-bucket \
  --bucket gs-aws-yamamoto-test \
  --region ap-northeast-1 \
  --acl public-read-write \
  --create-bucket-configuration LocationConstraint=ap-northeast-1 \
  --profile try_aws_func
```

## s3 ファイルを作成し、upload
```
$ touch gs-aws-s3-yamamoto.csv # yamamotoは自分の名前に置き換える
$ aws s3 cp gs-aws-s3-yamamoto.csv s3://gs-aws-yamamoto-test/ --acl public-read-write --profile try_aws_func
```

## lambdaからs3をuploadする例
reloate-s3-from-lambda.rb

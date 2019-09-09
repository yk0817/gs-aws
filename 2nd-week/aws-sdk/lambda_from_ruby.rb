require "aws-sdk"
# https://docs.aws.amazon.com/sdk-for-ruby/v3/api/Aws/Lambda/Client.html
client = Aws::Lambda::Client.new(
  profile: "try_aws_func", # profileはdefault設定がであれば、使う必要はない
  region: "ap-northeast-1" # ~/.aws/config に設定している値と違う場合
  )
# https://docs.aws.amazon.com/sdk-for-ruby/v3/api/Aws/Lambda/Client.html#invoke-instance_method
client.invoke({
  function_name: "lambda_handler",
  invocation_type: "Event",
  log_type: "Tail"
})

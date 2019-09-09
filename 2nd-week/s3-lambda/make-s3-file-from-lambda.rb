# lambdaで実行する際は、aws-sdkをインストールする必要はない
require "aws-sdk-s3"

def lambda_handler(event:, context:)
  file_name = "yamamoto-s3-upload-#{Time.now}.txt"

  File.open("/tmp/#{file_name}", "w+") do |f|
    f.puts("write test")
  end

  client = Aws::S3::Client.new()
  client.put_object(
    bucket: "gs-aws-yamamoto-test",
    key: file_name,
    body: File.open("/tmp/#{file_name}")
    )
end

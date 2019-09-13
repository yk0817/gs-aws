# 目的:
# 本当はファイルを分けてみたほうが良い
# 初めての週のlambdaプログラムを参考にした。
provider "aws" {
  region = "ap-northeast-1"
  profile = "try_aws_func"
}

resource "aws_lambda_function" "lambda_from_terraform" {
    function_name = "demo_lambda"
    handler = "main.handler"
    runtime = "ruby2.5" # 実行環境
		role = "${aws_iam_role.lambda_exec_role.arn}"
    filename = "main.zip"
    # Used to trigger updates. Must be set to a base64-encoded SHA256 hash of the package file specified with either
    # https://www.terraform.io/docs/configuration/functions/base64sha256.html
    source_code_hash = "${base64sha256(file("main.zip"))}"
}

# resource名 labelとして定義している。
resource "aws_iam_role" "lambda_exec_role" {

  name = "lambda_exec_role"
	assume_role_policy = <<EOF
{
	"Version": "2012-10-17",
	"Statement": [
		{
			"Action": "sts:AssumeRole",
			"Principal": {
				"Service": "lambda.amazonaws.com"
			},
			"Effect": "Allow",
			"Sid": ""
		}
	]
}
EOF
}

resource "aws_iam_policy" "lambda_s3_write" {
  name = "lambda_s3_execute"
  path = "/"
  description = "IAM policy for logging from a lambda"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "logs:CreateLogStream",
        "logs:PutLogEvents"
      ],
      "Resource": "arn:aws:logs:*:*:*",
      "Effect": "Allow"
    },
    {
      "Action": [
        "s3:*"
      ],
      "Resource": "arn:aws:s3:::gs-aws-yamamoto-test",
      "Effect": "Allow"
    }
  ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "lambda_s3_write" {
  role = "${aws_iam_role.lambda_exec_role.name}"
  policy_arn = "${aws_iam_policy.lambda_s3_write.arn}"
}


require "./apis/a3rt"
require "./helpers/formatter"
# 処理の流れ: 
# 1.Webhookから受け取ったテキストからA3rtのAPIリクエスト
# 2.1のレスポンスを整形
# 3.整形したテキストを返し、Slackポスト
def lambda_handler(event:, context:)
  raise InvalidToken unless ENV["SLACK_OUTGOING_TOKEN"] == event["token"]
  response = A3rt::Api.request(text: event["text"])
  reply = Formatter.format_response(response)
  { "text": reply }
end

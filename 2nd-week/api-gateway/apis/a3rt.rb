require "a3rt_client"
require "./errors/errors"
# A3RTのAPIリクエストを行う。
# MEMO: A3RTの呼び出しをメソッド化して見やすくしたほうが良いが
#       本筋ではないので今回は何もしない

class A3rt::Api # A3rt::Clientだとgemとバッティングするため、Apiつけてる
  class << self
    def request(text:)
      case text
      when /【Talk】[\s　]*(.+)/
        A3rt::Client.talk_api(
          apikey: ENV["A3RT_TALK_API_KEY"], 
          query: $1
        )
      when /【Suggest】[\s　]*(.+)/
        A3rt::Client.text_suggest(
          apikey: ENV["A3RT_TEXT_SUGGEST_API_KEY"], 
          previous_description: $1
        )
      when /【Summerize】[\s　]*(.+)/
        A3rt::Client.text_summarization(
          apikey: ENV["A3RT_TEXT_SUMMARIZATION_API_KEY"], 
          sentences: $1
        )
      else
        p "---------------"
        p "REQUEST:ERROR"
        p "INPUT_TEXT: #{text}"
        p "---------------"
        raise InvalidText
      end
    end
  end
end

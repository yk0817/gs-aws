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
        talk(query: $1)
      when /【Suggest】[\s　]*(.+)/
        text_suggest(previous_description: $1)
      when /【Summerize】[\s　]*(.+)/
        text_summarization(sentences: $1)
      else
        p "---------------"
        p "REQUEST:ERROR"
        p "INPUT_TEXT: #{text}"
        p "---------------"
        raise InvalidText
      end
    end
      
      private

        def talk(query:)
          A3rt::Client.talk_api(
            apikey: ENV["A3RT_TALK_API_KEY"], 
            query: query
          )
        end

        def text_suggest(previous_description:)
          A3rt::Client.text_suggest(
            apikey: ENV["A3RT_TEXT_SUGGEST_API_KEY"], 
            previous_description: previous_description
          )
        end

        def text_summarization(sentences:)
          A3rt::Client.text_summarization(
            apikey: ENV["A3RT_TEXT_SUMMARIZATION_API_KEY"], 
            sentences: sentences
          )
        end
  end
end

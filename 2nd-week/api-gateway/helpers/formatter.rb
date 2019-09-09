require "./errors/errors"
# APIレスポンスのキーに応じて、個々のAPIに応じたレスポンスの整形を行う
# Talk API: resultsのキーが存在
# Text Suggest: suggestionのキーが存在
# Text Summary: summaryのキーが存在
class Formatter
  class << self
    def format_response(response)
      if response.has_key?("results")
        response["results"][0]["reply"]
      elsif response.has_key?("suggestion")
        response["suggestion"].to_s
      elsif response.has_key?("summary")
        response["summary"][0]
      else
        p "---------------"
        p "FORMAT:ERROR"
        p "RESPONSE: #{response}"
        p "---------------"
        raise InvalidResponse
      end
    end
  end
end

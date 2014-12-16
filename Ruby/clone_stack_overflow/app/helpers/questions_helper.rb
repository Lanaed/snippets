require 'httparty'

module QuestionsHelper
  class Octokit

    attr_accessor :response
    def initialize

      token = ENV['GH_BASIC_CLIENT_IDh']
      user = ENV['GH_CLIENT_USERNAME']

      @response = HTTParty.get("https://api.github.com/zen", :headers => {"Authorization" => "token #{token}", "User-Agent" => "#{user}"} )

      if @response["message"] == "Bad credentials"
        @response = "sample enthusiastic message"
      end
    end
  end
end

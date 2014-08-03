module Yo
  class Client
    def initialize(api_token: '')
      @http = HTTP.new(api_token: api_token)
    end

    def yo(username: '')
      @http.yo(username: username)
    end

    def yoall
      @http.yoall
    end

    def subscribers_count
      @http.subscribers_count
    end
  end
end

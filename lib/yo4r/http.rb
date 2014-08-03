require 'faraday'
require 'json'

module Yo
  class HTTP
    def initialize(api_token: nil)
      @api_token = api_token
      @faraday   = Faraday.new('http://api.justyo.co')
    end

    def yo(username: nil)
      return true if access_api { @faraday.post('/yo/', api_token: @api_token, username: username) }
    end

    def yoall
      access_api { @faraday.post('/yoall/', api_token: @api_token) }
    end

    def subscribers_count
      access_api { @faraday.get('/subscribers_count/', api_token: @api_token) }
    end

    private def access_api
      begin
        responce = yield
      rescue Exception => e
        raise UnknownError, e.message
      end
      params = JSON.parse(responce.body)
      raise ClientError, params['error'] if params['error']
      params['result']
    end
  end
end

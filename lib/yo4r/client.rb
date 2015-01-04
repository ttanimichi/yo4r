require 'faraday'
require 'json'

module Yo
  class Client
    def initialize(api_token: '')
      @api_token = api_token
      @http      = Faraday.new 'http://api.justyo.co'
    end

    def yo(username: '')
      true if access_api { @http.post('/yo/', api_token: @api_token, username: username) }
    end

    def yoall
      access_api { @http.post('/yoall/', api_token: @api_token) }
    end

    def subscribers_count
      access_api { @http.get('/subscribers_count/', api_token: @api_token) }
    end

    private def access_api
      begin
        response = yield
        params = JSON.parse(response.body)
      rescue Exception => e
        raise UnknownError, e.message
      end
      raise ClientError, params['error'] if params['error']
      params['result']
    end
  end
end

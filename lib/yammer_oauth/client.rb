require 'yammer_oauth/account'
require 'yammer_oauth/messages'
require 'yammer_oauth/search'
require 'yammer_oauth/status'

module YammerOAuth
  class Client
    def initialize(options = {})
      @consumer_key = options[:consumer_key]
      @consumer_secret = options[:consumer_secret]
      @token = options[:token]
      @secret = options[:secret]
    end

    def request_token(options = {})
      consumer.get_request_token(options)
    end

    def authorize(token, secret, options = {})
      request_token = OAuth::RequestToken.new(
        consumer, token, secret
      )
      @access_token = request_token.get_access_token(options)
      @token = @access_token.token
      @secret = @access_token.secret
      @access_token
    end

    def request_token(options = {})
      consumer.get_request_token(options)
    end

    private
    def consumer
      @consumer ||= OAuth::Consumer.new(@consumer_key, @consumer_secret, {:site => 'https://www.yammer.com'})
    end

    def access_token
      @access_token ||= OAuth::AccessToken.new(consumer, @token, @secret)
    end
  end
    
end

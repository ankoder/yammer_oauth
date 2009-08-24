module YammerOAuth
  class Client
    # Return an HTTP 200 OK respponse code and a representation of the
    # requesting user if authentication was successful
    def authorized?(options = {})
      oauth_response = access_token.get "/api/v1/users/current.json"
      oauth_response.class == Net::HTTPOK
    end

    # Return current user's information
    def info
      oauth_response = access_token.get "/api/v1/users/current.json"
      JSON.parse(oauth_response.body)
    end
  end
end

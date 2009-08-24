module YammerOAuth
  class client

    # Return a list of messages, users, tags and groups that match the user's
    # search query.
    def search(query_string, page = 1)
      oauth_response = access_token.get("/api/v1/search.json", :search => query_string, :page => page)
      JSON.parse(oauth_response)
    end
  end
end

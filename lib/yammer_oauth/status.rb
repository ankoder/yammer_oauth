module YammerOAuth
  class Client
    def friends_timeline(older_than = nil)
      @statuses = []
      oauth_response = access_token.get("/api/v1/messages.json")
      @messages = JSON.parse(oauth_response.body)["messages"]
      @messages.each do |msg|
        status[:user] = sorted_users[msg["sender_id"]]
        status[:text] = msg["body"]["plain"]
        @statuses << status
      end
      @statuses
    end

    # Users in this network
    def users
      oauth_response = access_token.get("/api/v1/users.json")
      JSON.parse(oauth_response.body)
    end

    def sorted_users
      @sorted_users = {}
      users.each do |usr|
        @sorted_users[usr["id"]] = {:full_name => usr["full_name"], :web_url => usr["web_url"], :mugshot_url => usr["mugshot_url"] } }
      end
    end

    def update(message,options = {})
      oauth_response = access_token.post("/api/v1/messages/", :body => message)
      JSON.parse(oauth_response.body)
    end


  end
end

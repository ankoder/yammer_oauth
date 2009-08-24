module YammerOAuth
  class client
    
    # All messages in this network. Corresponds to the "All" tab on the
    # website.
    def messages(older_than = nil, newer_than = nil)
      oauth_response = access_token.get "/api/v1/messages.json"
      JSON.parse(oauth_response.body)
    end

    # Return a list of the 20 most recent direct messages sent by the
    # authenticated user
    def sent_messages
      oauth_response = access_token.get "/api/v1/messages/sent.json"
      JSON.parse(oauth_response)
    end

    # Return messages received by the logged-in user. Corresponds to the
    # "Received" tab on the website.
    def received_messages
      oauth_response = access_token.get "/api/v1/messages/received.json"
      JSON.parse(oauth_response)
    end

    # Return messages in the group with the given ID. Corresponds to the
    # messages you'd see on a group's profile page.
    def group_messages(group_id)
      oauth_response = access_token.get "/api/v1/messages/in_group/#{group_id}.json"
      JSON.parse(oauth_response)
    end

    # Update the current user's status
    def update(message, group_id = nil)
      if group_id.nil?
        oauth_response = access_token.post("/api/v1/messages", :body => message)
      else
        oauth_response = access_token.post("/api/v1/messages", :body => message, :group_id => group_id)
      end
      JSON.parse(oauth_response)
    end

    # Delete a message owned by the current user
    def delete(message_id)
      oauth_response = access_token.delete("/api/v1/messages/#{message_id}")
      JSON.parse(oauth_response)
    end

    # Reply to a message
    def reply_to(message, message_id)
      oauth_response = access_token.post("/api/v1/messages", :body => message, :replied_to_id => message_id)
      JSON.parse(oauth_response)
    end

    # Sends a private message direct to the user indicated
    def direct_to(message, user_id)
      oauth_response = access_token.post("/api/v1/messages", :body => message, :direct_to_id => user_id)
      JSON.parse(oauth_response)
    end
  end
end

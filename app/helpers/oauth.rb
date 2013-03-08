helpers do
  def consumer
    consumer_key = "JbwM73HDpxHItZR75CJfw"       # what twitter.com/apps says   
    consumer_secret = "VMuiDSFELiwHvBf9KmarpYz4XINJuDurCNbOCvk3kE8" # shhhh, its a secret   
    OAuth::Consumer.new(consumer_key, consumer_secret, :site => "https://api.twitter.com")
  end

  def request_token
    return session[:request_token] if session[:request_token]
    request = consumer.get_request_token(:oauth_callback => "http://127.0.0.1:9292/oauth")
    session[:request_token]        = request.token
    session[:request_token_secret] = request.secret
    session[:request_token] = request
  end

  def client
    consumer_key = "JbwM73HDpxHItZR75CJfw"       # what twitter.com/apps says   
    consumer_secret = "VMuiDSFELiwHvBf9KmarpYz4XINJuDurCNbOCvk3kE8" # shhhh, its a secret
    token, secret = token_and_secret
    Twitter::Client.new(:consumer_key => consumer_key, :consumer_secret => consumer_secret, oauth_token: token, oauth_token_secret: secret)
  end

  def client_profile_and_image
    user = client.user
    clear_tokens
    [user.username, user.profile_image_url]
  end

  def access_token
    session[:access_token] ||= request_token.get_access_token(:oauth_verifier => params[:oauth_verifier])
  end

  def token_and_secret
    [access_token.token, access_token.secret]
  end

  def clear_tokens
    session.delete(:request_token)
    session.delete(:access_token)
  end

end

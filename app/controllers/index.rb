before do
<<<<<<< HEAD
  @inspiration = Inspiration.find(1)
=======
  @inspiration ||= "'What a beautiful day'"
  # session[:oauth] ||= {}

  # host = request.host
  # host << ":9292" if request.host == "localhost"

  # consumer_key = "JbwM73HDpxHItZR75CJfw"       # what twitter.com/apps says   
  # consumer_secret = "VMuiDSFELiwHvBf9KmarpYz4XINJuDurCNbOCvk3kE8" # shhhh, its a secret   

  # @consumer = OAuth::Consumer.new(consumer_key, consumer_secret, :site => "https://api.twitter.com")

  # # generate a request token for this user session if we haven't already
  # request_token = session[:oauth][:request_token]   
  # request_token_secret = session[:oauth][:request_token_secret]

  # if request_token.nil? || request_token_secret.nil?
  #   # new user? create a request token and stick it in their session
  #   @request_token = @consumer.get_request_token(:oauth_callback => "http://#{host}/oauth")
  #   session[:oauth][:request_token] = @request_token.token
  #   session[:oauth][:request_token_secret] = @request_token.secret
  # else
  #   # we made this user's request token before, so recreate the object
  #   @request_token = OAuth::RequestToken.new(@consumer, request_token, request_token_secret)
  # end

  # this is what we came here for...   
  # access_token = session[:oauth][:access_token]   
  # access_token_secret = session[:oauth][:access_token_secret]
  # unless access_token.nil? || access_token_secret.nil?
  #   # @access_token = OAuth::AccessToken.new(@consumer, access_token, access_token_secret)    
  #   @client = Twitter::Client.new oauth_token: access_token, oauth_token_secret: access_token_secret     
  #   if User.find_by_access_token(access_token) == nil
  #     user = User.create(:access_token => access_token, :access_token_secret => access_token_secret)
  #     session[:user_id] = user.id
  #   else
  #     user = User.find_by_access_token(access_token)
  #     session[:user_id] = user.id
  #   end  
  # end
>>>>>>> master
end


get '/' do
  erb :index
end

get 'request' do


end

get '/inspiration/:id' do 
  @inspiration = Inspiration.find(params[:id])
  session[:inspiration_id => params[:id]]
  erb :show_inspiration
end

post '/photos' do
  photo = Photo.new
  puts params
  photo.representation = params[:image]
  photo.save
  @inspiration.photos << photo
  redirect '/inspiration'
end

get '/inspiration' do 
  puts ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
  @photos = @inspiration.photos
  erb :voting_wall
end

<<<<<<< HEAD
=======
get "/request" do
  redirect request_token.authorize_url
end

get "/oauth" do
  key, secret = token_and_secret
  username, profile_image_url = client_profile_and_image
  user = User.create :username => username, 
              :profile_image_url => profile_image_url, 
              :access_token => key, 
              :access_token_secret => secret
  session[:user_id] = user.id

  redirect "/"
end

delete '/signout' do
  session.clear
end
>>>>>>> master

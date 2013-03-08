before do

end


get '/' do
  erb :index
end



get '/inspirations/:id' do 
  @inspiration = Inspiration.find(params[:id])
  session[:inspiration_id => params[:id]]
  @photos = @inspiration.photos
  erb :show_inspiration
end

post '/inspirations/:id/photos' do
  photo = Photo.new
  puts params
  photo.representation = params[:image]
  photo.save
  inspiration = Inspiration.find(params[:id])
  inspiration.photos << photo
  redirect "/inspirations/#{inspiration.id}"
end

get '/create_inspiration' do
  erb :create_inspiration
end

post '/inspiration' do
  inspiration = Inspiration.new(:content=> params[:content], :author_id => session[:user_id])
  if inspiration.save
    User.all.each do |user|
      Pony.mail(
        :to => user.email, 
        :from => "Christophersell3@gmail.com", 
        :subject => "inspiring!", 
        :html_body => "This is your inspiration of the day: #{inspiration.content}. Post a picture <a href='http://0.0.0.0:9292/inspirations/#{inspiration.id}'>here</a>", 
        :via => :smtp, 
        :via_options => {
          :address     => 'smtp.gmail.com',
          :port     => '587',
          :user_name     => 'inspireme3332@gmail.com',
          :password => 'wowthatis',
          :authentication     => :plain,           # :plain, :login, :cram_md5, no auth by default
          :domain   => "0.0.0.0:9292"     # the HELO domain provided by the client to the server
      })
    end
    erb :create_inspiration
  else
    erb :create_inspiration
  end
end

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

  redirect "/signin"
end

get '/signin' do 
  erb :signin
end

post '/signin' do
  user = User.find(session[:user_id])
  email = params[:email]
  user.update_attribute(:email, email)
  redirect "/users/#{user.id}"
end

delete '/signout' do
  session.clear
end

get '/users/:id' do
  erb :user_show
end

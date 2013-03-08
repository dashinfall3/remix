before do
  @inspiration = Inspiration.find(1)
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


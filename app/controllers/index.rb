before do
  @inspiration ||= "'What a beautiful day'"
end


get '/' do
  erb :index
end


get '/user/:id' do 
  @user = User.find(params[:id])
  erb :show_inspiration
end

post 'upload_image' do
  @image = Image.create(parms[:image])

end

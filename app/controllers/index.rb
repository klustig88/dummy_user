get '/' do
  erb :index
end

post '/login' do
  @jake = User.find_by_email(params[:user][:email])
  if @jake.try(:authenticate, params[:user][:password])
    erb :user
  else
    erb :fail_auth
  end
end


post '/create_user' do
  User.create(params[:create_user])
  redirect to ('/')
end

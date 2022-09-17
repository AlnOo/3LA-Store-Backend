class ApplicationController < Sinatra::Base

  set :default_content_type, 'application/json'
  
  # Get all users
  get '/users' do
    users = User.all
    users.to_json
  end

  # Create a new user
  post '/users' do 
    user = User.create(
      first_name: params[:first_name], 
      last_name: params[:last_name], 
      email: params[:email], 
      password: params[:password], 
      password_confirmation: params[:password_confirmation])
    user.to_json
  end

  # Delete a user
  delete '/users/:id' do
    user = User.all.find(params[:id])
    user.delete
    user.to_json
  end

end
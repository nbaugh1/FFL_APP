class UsersController < ApplicationController

  
  get '/login' do
      erb :"/users/login"
  end
  
  post "/login" do
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect to "/teams"
    else
      redirect to "/failure"
    end
  end
  
  get "/signup" do
    erb :"/users/new.html"
  end

  post "/signup" do
    if params[:username] == "" || params[:password] == ""
      redirect to '/failure'
    else
      @user = User.create(username: params[:username], password: params[:password])
      session[:user_id] = @user.id
      redirect to '/teams'
    end
  end

end

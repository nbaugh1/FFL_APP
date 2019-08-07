class UsersController < ApplicationController

  
  get '/login' do
    if !logged_in?
      erb :"/users/login"
    else
      redirect to '/teams'
    end
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
      #binding.pry
      User.create(username: params[:username], password: params[:password])
      redirect to '/login'
    end
  end

  
  # POST: /users
  post "/users" do
    redirect "/users"
  end

  # GET: /users/5
  get "/users/:id" do
    erb :"/users/show.html"
  end

  # GET: /users/5/edit
  get "/users/:id/edit" do
    erb :"/users/edit.html"
  end

  # PATCH: /users/5
  patch "/users/:id" do
    redirect "/users/:id"
  end

  # DELETE: /users/5/delete
  delete "/users/:id/delete" do
    redirect "/users"
  end
end

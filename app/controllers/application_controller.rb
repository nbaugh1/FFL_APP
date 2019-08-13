require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "shots_fired"
  end

  get "/" do
    erb :welcome
  end

  get '/logout' do
    if session[:user_id] != nil
      session.destroy
      redirect to '/'
    else
      redirect to '/teams'
    end
  end
  
  get '/failure' do
    erb :"/failure"
  end

  helpers do
    
    def logged_in?
      !!session[:user_id]
    end

    def current_user
      User.find(session[:user_id])
    end

    def redirect_if_not_logged_in
      redirect '/login' if !logged_in?
    end

  end
end



class TeamsController < ApplicationController

  # GET: /teams
  get "/teams" do
    if !logged_in?
      redirect to '/login'
    else
      @user = current_user
      erb :"/teams/index.html"
    end
  end

  # GET: /teams/new
  get "/teams/new" do
    erb :"/teams/new.html"
  end

  # POST: /teams
  post "/teams" do
    @user = current_user
    @team = Team.create(name: params[:team_name], roster_size: params[:roster_size])
    @team.user = @user
    @team.save

    redirect "/teams"
  end

  # GET: /teams/5
  get "/teams/:id" do
    erb :"/teams/show.html"
  end

  # GET: /teams/5/edit
  get "/teams/:id/edit" do
    erb :"/teams/edit.html"
  end

  # PATCH: /teams/5
  patch "/teams/:id" do
    redirect "/teams/:id"
  end

  # DELETE: /teams/5/delete
  delete "/teams/:id/delete" do
    redirect "/teams"
  end
end
class TeamsController < ApplicationController

  # GET: /teams
  get "/teams" do
    redirect_if_not_logged_in
    @user = current_user
    erb :"/teams/index.html"
  end

  # GET: /teams/new
  get "/teams/new" do
    redirect_if_not_logged_in
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
    redirect_if_not_logged_in
    @team = Team.find(params[:id])
    erb :"/teams/show.html"
  end

  # GET: /teams/5/edit
  get "/teams/:id/edit" do
    redirect_if_not_logged_in
    @team = Team.find(params[:id])
    session[:team_id] = params[:id]
    erb :"/teams/edit.html"
  end

  # PATCH: /teams/5
  patch "/teams/:id" do
    @team = Team.find(params[:id])
    if params[:new_team_name] != @team.name && params[:new_team_name] != ""
      @team.name = params[:new_team_name]
    elsif params[:new_roster_size] != @team.roster_size && params[:new_roster_size] != nil
      @team.roster_size = params[:new_roster_size]
    end
    @team.save
    redirect "/teams/#{@team.id}/edit"
  end

  get "/teams/:id/add_player" do 
      redirect_if_not_logged_in
      
      @positions = ["QB", "RB", "WR", "TE", "PK", "DEF"]
      @team = Team.find(params[:id])
      session[:team_id] = params[:id]
      if session[:user_id] == @team.user_id
        erb :"/teams/add_player"
      else
        redirect to '/login'
      end
  end

  delete "/teams/:id/delete" do
   redirect_if_not_logged_in
      @team = Team.find(params[:id])
      @team.players.each do |player|
        player.team_id = nil
        player.save
      end
      @team.destroy
      session[:team_id] = nil
      redirect '/teams'
  end
end

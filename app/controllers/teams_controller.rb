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
    if !logged_in?
      redirect to '/login'
    else
      erb :"/teams/new.html"
    end
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
    @team = Team.find(params[:id])
    #binding.pry
    if logged_in? && @team.user.id == session[:user_id]
      @team = Team.find(params[:id])
      #binding.pry
      erb :"/teams/show.html"
    else
      redirect to '/login'

    end
  end

  # GET: /teams/5/edit
  get "/teams/:id/edit" do
    @team = Team.find(params[:id])
    session[:team_id] = params[:id]
    erb :"/teams/edit.html"
  end

  # PATCH: /teams/5
  patch "/teams/:id" do
    @team = Team.find(params[:id])
    #binding.pry
    if params[:new_team_name] != @team.name && params[:new_team_name] != ""
      @team.name = params[:new_team_name]
    elsif params[:new_roster_size] != @team.roster_size && params[:new_roster_size] != nil
      #binding.pry
      @team.roster_size = params[:new_roster_size]
    end
    @team.save
    redirect "/teams/#{@team.id}/edit"
  end

  get "/teams/:id/add_player" do 
    if !logged_in?
      redirect to "/login"
    else
      @positions = ["QB", "RB", "WR", "TE", "PK", "DEF"]
      @team = Team.find(params[:id])
      session[:team_id] = params[:id]
      erb :"/teams/add_player"
    end
  end

  delete "/teams/:id/delete" do
    if logged_in?
      @team = Team.find(params[:id])
      #redirect to "/cases" unless authorize 
      @players = []
      @players << Player.find_by(team_id: params[:id])
      #binding.pry
      @players.each do |player|
        #binding.pry
        player.team_id = nil
        player.save
      end
      @team.destroy
      session[:team_id] = nil
      #flash[:alert] = "case deleted"
      redirect '/teams'
    else
        redirect '/login'
    end
  end
end

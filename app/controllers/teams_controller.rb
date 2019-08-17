class TeamsController < ApplicationController
  get "/teams" do
    redirect_if_not_logged_in
    @user = current_user
    erb :"/teams/index.html"
  end

  get "/teams/new" do
    redirect_if_not_logged_in
    erb :"/teams/new.html"
  end

  post "/teams" do
    @user = current_user
    @team = Team.create(name: params[:team_name], roster_size: params[:roster_size])
    @team.user = @user
    @team.save

    redirect "/teams"
  end

  get "/teams/:id/drop_player" do
    @player = Player.find(params[:id])
    @old_id = @player.team_id
    @player.team.id = nil
    @player.team_id = nil
    @player.save
    redirect to "/teams/#{@old_id}/add_player"
  end

  get "/teams/:id" do
    redirect_if_not_logged_in
    @team = Team.find(params[:id])
    erb :"/teams/show.html"
  end

  get "/teams/:id/edit" do
    redirect_if_not_logged_in
    @team = Team.find(params[:id])
    session[:team_id] = params[:id]
    erb :"/teams/edit.html"
  end

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

    @players = params[:search] ? Player.all.select { |p| p.first_name.downcase.include?(params[:search].downcase) } : Player.all

    @positions = ["QB", "RB", "WR", "TE", "PK", "DEF"]
    @team = Team.find(params[:id])
    session[:team_id] = params[:id]
    if session[:user_id] == @team.user_id
      erb :"/teams/add_player"
    else
      redirect to "/login"
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
    redirect "/teams"
  end
end

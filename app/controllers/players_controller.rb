class PlayersController < ApplicationController

  get "/players" do
    @positions = ["QB", "RB", "WR", "TE", "PK", "DEF"]
    erb :"/players/index.html"
  end

  get "/players/:id" do
    @player = Player.find(params[:id])
    @team = Team.find(session[:team_id])
    erb :"/players/show.html"
  end

  get "/players/:id/edit" do
    redirect_if_not_logged_in
    @player = Player.find(params[:id])
    @team = Team.find(session[:team_id])
    erb :"/players/edit.html"
  end

  post "/players/:id" do
    if params.values.any? {|value| value == ""}
      redirect to "/players/#{params[:id]}/edit"
    else
      @player = Player.find(params[:id])
      @player.actual_price = params[:actual_price]
      @player.team_id = session[:team_id]
      @player.save
      redirect to "/players/#{@player.id}"
    end
  end
end

class PlayersController < ApplicationController

  # GET: /players
  get "/players" do
    @positions = ["QB", "RB", "WR", "TE", "PK", "DEF"]
    erb :"/players/index.html"
  end

  # GET: /players/new
  get "/players/new" do
    erb :"/players/new.html"
  end

  # POST: /players
  post "/players" do
    redirect "/players"
  end

  # GET: /players/5
  get "/players/:id" do
    @player = Player.find(params[:id])
    @team = Team.find(session[:team_id])
    erb :"/players/show.html"
  end

  # GET: /players/5/edits
  get "/players/:id/edit" do
    @player = Player.find(params[:id])
    @team = Team.find(session[:team_id])
    erb :"/players/edit.html"
  end

  # PATCH: /players/5
  post "/players/:id" do
    #binding.pry
      if params.values.any? {|value| value == ""}
        redirect to "/players/#{params[:id]}/edit"
      else
        @player = Player.find(params[:id])
        @player.actual_price = params[:actual_price]
        @player.projected_price = params[:projected_price]
        @player.team_id = session[:team_id]
        @player.save
        redirect to "/players/#{@player.id}"
      end
  end

  # DELETE: /players/5/delete
  delete "/players/:id/delete" do
    redirect "/players"
  end
end

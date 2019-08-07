class LeaguesController < ApplicationController

  # GET: /leagues
  get "/leagues" do
    erb :"/leagues/index.html"
  end

  # GET: /leagues/new
  get "/leagues/new" do
    erb :"/leagues/new.html"
  end

  # POST: /leagues
  post "/leagues" do
    redirect "/leagues"
  end

  # GET: /leagues/5
  get "/leagues/:id" do
    erb :"/leagues/show.html"
  end

  # GET: /leagues/5/edit
  get "/leagues/:id/edit" do
    erb :"/leagues/edit.html"
  end

  # PATCH: /leagues/5
  patch "/leagues/:id" do
    redirect "/leagues/:id"
  end

  # DELETE: /leagues/5/delete
  delete "/leagues/:id/delete" do
    redirect "/leagues"
  end
end

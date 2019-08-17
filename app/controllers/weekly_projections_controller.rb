class WeeklyProjectionsController < ApplicationController

  # GET: /weekly_projections
  get "/weekly_projections" do
    erb :"/weekly_projections/index.html"
  end

  # GET: /weekly_projections/new
  get "/weekly_projections/new" do
    erb :"/weekly_projections/new.html"
  end

  # POST: /weekly_projections
  post "/weekly_projections" do
    redirect "/weekly_projections"
  end

  # GET: /weekly_projections/5
  get "/weekly_projections/:id" do
    erb :"/weekly_projections/show.html"
  end

  # GET: /weekly_projections/5/edit
  get "/weekly_projections/:id/edit" do
    erb :"/weekly_projections/edit.html"
  end

  # PATCH: /weekly_projections/5
  patch "/weekly_projections/:id" do
    redirect "/weekly_projections/:id"
  end

  # DELETE: /weekly_projections/5/delete
  delete "/weekly_projections/:id/delete" do
    redirect "/weekly_projections"
  end
end

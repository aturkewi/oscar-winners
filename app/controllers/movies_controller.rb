class MoviesController < ApplicationController

  def index
    @movies = Movie.all
    @average_budget = Movie.average_budget
  end

end

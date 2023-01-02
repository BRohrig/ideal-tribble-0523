class MoviesController < ApplicationController
  def show
    @movie = Movie.find(params[:id])
    @actor_sort = @movie.actors.order('age ASC')
    @actor_age = @movie.actors.average(:age).round(0).to_i
  end

end
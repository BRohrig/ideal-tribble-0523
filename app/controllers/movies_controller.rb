class MoviesController < ApplicationController
  def show
    @movie = Movie.find(params[:id])
    @actor_sort = @movie.actors.order('age ASC')
    @actor_age = @movie.actors.average(:age).round(0).to_i
  end

  def update
    @movie = Movie.find(params[:id])
    @actor = Actor.find(params[:actor_id])
    ActorMovie.create(actor: @actor, movie: @movie)
    redirect_to "/movies/#{@movie.id}"
  end

end
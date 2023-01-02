class DropActorsMovies < ActiveRecord::Migration[5.2]
  def change
    drop_table :actors_movies

  end
end

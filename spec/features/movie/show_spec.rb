require 'rails_helper'

RSpec.describe 'movie show page' do
  before :each do
    @studio = Studio.create!(name: "Bad Studio", location: "Fargo")
    @movie = @studio.movies.create!(title: "That One Movie", creation_year: "2021", genre: "Comedy")
    @actor1 = @movie.actors.create!(name: "Jim", age: 23)
    @actor3 = @movie.actors.create!(name: "Will", age: 92)
    @actor2 = @movie.actors.create!(name: "Bob", age: 26)
    @actor4 = @movie.actors.create!(name: "Jane", age: 138)
    @actor5 = Actor.create!(name: "Annie", age: 24)
  end

  it 'has the movies info and lists its actors from youngest to oldest and gives average age' do
    visit "/movies/#{@movie.id}"

    expect(page).to have_content(@movie.title)
    expect(page).to have_content(@movie.creation_year)
    expect(page).to have_content(@movie.genre)
    within '#actors' do
      expect(@actor1.name).to appear_before(@actor2.name)
      expect(@actor2.name).to appear_before(@actor3.name)
      expect(@actor3.name).to appear_before(@actor4.name)
      expect(page).to_not have_content(@actor5.name)
      expect(page).to have_content("Average Actor Age: 70")
    end
  end

  it 'has the ability to add another actor to a movie' do
    visit "/movies/#{@movie.id}"

    expect(page).to have_content("Add Actor")
    expect(page).to have_field(:actor_id)
    expect(page).to have_button("Submit")

    fill_in :actor_id, with: "#{@actor5.id}"
    
    click_button("Submit")
    save_and_open_page
    expect(current_path).to eq("/movies/#{@movie.id}")

    within '#actors' do
      expect(@actor1.name).to appear_before(@actor5.name)
      expect(@actor5.name).to appear_before(@actor3.name)
      expect(page).to have_content("Average Actor Age: 61")

    end


  end


end
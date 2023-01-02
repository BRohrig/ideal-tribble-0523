require 'rails_helper'

RSpec.describe 'studio index page' do
  before :each do
    @studio1 = Studio.create!(name: 'Paramount Pictures', location: 'Hollywood')
    @studio2 = Studio.create!(name: 'HappyMuffin Films', location: 'Timbuktu')
    @studio3 = Studio.create!(name: 'I Like Movies', location: 'Paris')

    @movie1 = @studio1.movies.create!(title: 'Movie and Stuff', creation_year: "2002", genre: 'Drama')
    @movie2 = @studio1.movies.create!(title: 'Stuff and Movie', creation_year: "2005", genre: 'Action')
    @movie3 = @studio1.movies.create!(title: 'And Movie Stuff', creation_year: "2019", genre: 'Comedy')
    @movie4 = @studio2.movies.create!(title: 'My Happy Movie', creation_year: "2001", genre: 'Drama')
    @movie5 = @studio2.movies.create!(title: 'My Sad Movie', creation_year: "1999", genre: 'Comedy')
    @movie6 = @studio2.movies.create!(title: 'My Dumb Movie', creation_year: "2022", genre: 'Sci-Fi')
    @movie7 = @studio3.movies.create!(title: 'Le Movie', creation_year: "1992", genre: 'Foreign')
    @movie8 = @studio3.movies.create!(title: 'Le Movie Deux', creation_year: "1994", genre: 'Foreign')
  end

  it 'lists all the studios, their movies, creation year, and genre' do
    visit '/studios'

    within "#studio_id-#{@studio1.id}" do
      expect(page).to have_content(@studio1.name)
      expect(page).to have_content(@studio1.location)
      within "#movie_id-#{@movie1.id}" do
        expect(page).to have_content(@movie1.title)
        expect(page).to have_content(@movie1.creation_year)
        expect(page).to have_content(@movie1.genre)
      end
      within "#movie_id-#{@movie2.id}" do
        expect(page).to have_content(@movie2.title)
        expect(page).to have_content(@movie2.creation_year)
        expect(page).to have_content(@movie2.genre)
      end
      within "#movie_id-#{@movie3.id}" do
        expect(page).to have_content(@movie3.title)
        expect(page).to have_content(@movie3.creation_year)
        expect(page).to have_content(@movie3.genre)
      end
      expect(page).to_not have_content(@movie4.title)
      expect(page).to_not have_content(@movie5.title)
      expect(page).to_not have_content(@movie6.title)
      expect(page).to_not have_content(@movie7.title)
      expect(page).to_not have_content(@movie8.title)
    end

    within "#studio_id-#{@studio2.id}" do
      expect(page).to have_content(@studio2.name)
      expect(page).to have_content(@studio2.location)
      within "#movie_id-#{@movie4.id}" do
        expect(page).to have_content(@movie4.title)
        expect(page).to have_content(@movie4.creation_year)
        expect(page).to have_content(@movie4.genre)
      end
      within "#movie_id-#{@movie5.id}" do
        expect(page).to have_content(@movie5.title)
        expect(page).to have_content(@movie5.creation_year)
        expect(page).to have_content(@movie5.genre)
      end
      within "#movie_id-#{@movie6.id}" do
        expect(page).to have_content(@movie6.title)
        expect(page).to have_content(@movie6.creation_year)
        expect(page).to have_content(@movie6.genre)
      end
      expect(page).to_not have_content(@movie1.title)
      expect(page).to_not have_content(@movie2.title)
      expect(page).to_not have_content(@movie3.title)
      expect(page).to_not have_content(@movie7.title)
      expect(page).to_not have_content(@movie8.title)
    end

    within "#studio_id-#{@studio3.id}" do
      expect(page).to have_content(@studio3.name)
      expect(page).to have_content(@studio3.location)
      within "#movie_id-#{@movie7.id}" do
        expect(page).to have_content(@movie7.title)
        expect(page).to have_content(@movie7.creation_year)
        expect(page).to have_content(@movie7.genre)
      end
      within "#movie_id-#{@movie8.id}" do
        expect(page).to have_content(@movie8.title)
        expect(page).to have_content(@movie8.creation_year)
        expect(page).to have_content(@movie8.genre)
      end
      expect(page).to_not have_content(@movie1.title)
      expect(page).to_not have_content(@movie2.title)
      expect(page).to_not have_content(@movie3.title)
      expect(page).to_not have_content(@movie4.title)
      expect(page).to_not have_content(@movie5.title)
      expect(page).to_not have_content(@movie6.title)
    end



  end





end
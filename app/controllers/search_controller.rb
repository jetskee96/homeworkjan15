class SearchController < ApplicationController

  
  def search
  if params[:q].nil?
    @movie_genres = []
    @movie_themes = []
    @movies       = []
  else
    @movie_genres = MovieGenre.search params[:q]
    @movie_themes = MovieTheme.search params[:q]
    @movies = Movie.search params[:q]
  end
end

end

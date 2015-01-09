class SearchController < ApplicationController
  def search
  if params[:q].nil?
    @genre_linkers = []
  else
    @genre_linkers = GenreLinker.search params[:q]
  end
end
  
end

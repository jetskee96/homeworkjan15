class GenreLinkersController < ApplicationController
  before_action :set_genre_linker, only: [:show, :edit, :update, :destroy]
  before_action :set_movie
  before_action :authenticate_user!
  respond_to :html

  def index
    @genre_linkers = GenreLinker.all
    respond_with(@genre_linkers)
  end

  def show

  end

  def new
    @genre_linker = GenreLinker.new
    respond_with(@genre_linker)
  end

  def edit
  end

  def create
     @genre_linker = GenreLinker.new(genre_linker_params)
     @genre_linker.user_id = current_user.id
     @genre_linker.movie_id = @movie.id

     if @genre_linker.save
        redirect_to @movie
    else
      render 'new'
    end
  end

  def update
    @genre_linker.update(genre_linker_params)
    respond_with(@genre_linker)
  end

  def destroy
    @genre_linker.destroy
    respond_with(@genre_linker)
  end

  private
    def set_genre_linker
      @genre_linker = GenreLinker.find(params[:id])
    end
   
   def set_movie
      @movie = Movie.find(params[:movie_id])
   end

    def genre_linker_params
      params.require(:genre_linker).permit(:genre, :description)
    end
end
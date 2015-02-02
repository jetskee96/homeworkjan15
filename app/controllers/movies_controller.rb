class MoviesController < ApplicationController
  before_action :set_movie, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]


  def index
    @movies = Movie.all
  end


  def show
    @movie_genres = MovieGenre.where(movie_id: @movie.id)
    @movie_themes = MovieTheme.where(movie_id: @movie.id)
    @movie_locations = MovieLocation.where(movie_id: @movie.id)
    @movie_characters = MovieCharacter.where(movie_id: @movie.id)
    @movie_brands = MovieBrand.where(movie_id: @movie.id)
    @movie_goofs = MovieGoof.where(movie_id: @movie.id)
    @movie_references = MovieReference.where(movie_id: @movie.id)
    @movie_songs = MovieSong.where(movie_id: @movie.id)
    @movie_technicals = MovieTechnical.where(movie_id: @movie.id)
    @movie_quotes = MovieQuote.where(movie_id: @movie.id)
   # @movie_genre = MovieGenre.find(params[:movie_id])

  end


  def new
     @movie = current_user.movies.build
  end


  def edit
  end

  def create
    @movie = current_user.movies.build(movie_params)

    respond_to do |format|
      if @movie.save
        format.html { redirect_to @movie, notice: 'Movie was successfully created.' }
        format.json { render :show, status: :created, location: @movie }
      else
        format.html { render :new }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    respond_to do |format|
      if @movie.update(movie_params)
        format.html { redirect_to @movie, notice: 'Movie was successfully updated.' }
        format.json { render :show, status: :ok, location: @movie }
      else
        format.html { render :edit }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @movie.destroy
    respond_to do |format|
      format.html { redirect_to movies_url, notice: 'Movie was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_movie
      @movie = Movie.find(params[:id])
    end

    def movie_params
       params.require(:movie).permit(:title, :description, :movie_length, :poster)
    end
end

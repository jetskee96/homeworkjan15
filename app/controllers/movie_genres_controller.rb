class MovieGenresController < ApplicationController
  before_action :set_movie_genre, only: [:show, :edit, :update, :destroy, :votes]
  before_action :set_movie
  before_action :authenticate_user!, except: [:index, :show]
  
  respond_to :html

  def index
    @movie_genres = MovieGenre.all
  end

  def show
    @movie_genre_comments = MovieGenreComment.where(movie_genre_id: @movie_genre.id)
   # @similar_themes = MovieTheme.similar_themes(@movie_theme) 
  end

     def vote
      value = params[:type] == "up" ? 1 : -1
       @movie_genre = MovieGenre.find(params[:id])
       @movie_genre.add_or_update_evaluation(:votes, value, current_user)
      redirect_to :back, notice: "thanks for the vote"
   end

  def new
    @movie_genre = MovieGenre.new
    respond_with(@movie_genre)
  end

  def edit
  end

  def create
    @movie = Movie.find(params[:movie_id])
    @movie_genre = @movie.movie_genres.create(movie_genre_params)
    @movie_genre.user_id = current_user.id
    
    if @movie_genre.save
      redirect_to @movie
    else
      render 'new'
    end
end

  def update
    @movie_genre.update(movie_genre_params)
    respond_with(@movie_genre)
  end

  def destroy
    @movie_genre.destroy
    respond_with(@movie_genre)
  end

  private
    def set_movie_genre
      @movie_genre = MovieGenre.find(params[:id])
    end
  
    def set_movie
      @movie = Movie.find(params[:movie_id])
    end

    def movie_genre_params
      params.require(:movie_genre).permit(:title, :description)
    end
end

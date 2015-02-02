class MovieThemesController < ApplicationController
  before_action :set_movie_theme, only: [:show, :edit, :update, :destroy, :votes]
  before_action :set_movie
  before_action :authenticate_user!, except: [:index, :show]
  
  respond_to :html

  def index
    @movie_themes = MovieTheme.all
 
  end
  
  def show
    @movie_theme_comments = MovieThemeComment.where(movie_theme_id: @movie_theme.id)
 
  end
  
   def vote
     value = params[:type] == "up" ? 1 : -1
     @movie_theme = MovieTheme.find(params[:id])
     @movie_theme.add_or_update_evaluation(:votes, value, current_user)
     redirect_to :back, notice: "thanks for the vote"
   end

  def new
    @movie_theme = MovieTheme.new
    respond_with(@movie_theme)
  end

  def edit
  end

  def create
    @movie = Movie.find(params[:movie_id])
    @movie_theme = @movie.movie_themes.create(movie_theme_params)
    @movie_theme.user_id = current_user.id
    
    if @movie_theme.save
      redirect_to @movie
    else
      render 'new'
    end
end

  def update
    @movie_theme.update(movie_theme_params)
    respond_with(@movie_theme)
  end

  def destroy
    @movie_theme.destroy
    respond_with(@movie_theme)
  end
  
#  def similar_theme
#  @similar_themes = @movie.themes.inject({}) do |result_hash, theme|
#    result_hash[theme.title.to_sym], theme.movies.reject {|p| p == @movie}
#   result_hash
#end

  private
    def set_movie_theme
      @movie_theme = MovieTheme.find(params[:id])
    end
  
  def set_movie
    @movie = Movie.find(params[:movie_id])
  end

    def movie_theme_params
      params.require(:movie_theme).permit(:title, :description)
    end
end

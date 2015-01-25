class MovieThemeCommentsController < ApplicationController
  before_action :set_movie_theme_comment, only: [:show, :edit, :update, :destroy, :votes]
  before_action :set_movie, only: [:index, :create, :new]
  before_action :set_movie_theme, only: [:index, :create, :new]
  before_action :authenticate_user!, except: [:index, :show]
  respond_to :html

  def index
    @movie_theme_comments = MovieThemeComment.popular
    #respond_with(@movie_genre_comments)
  end
 
  
  def show
    # @movie_genre_comments = MovieGenreComment.find_with_reputation(:votes, :all, order: "votes desc")
    # @movie_genre_comment = MovieGenreComment.find(params[:movie_genre_id]) This may be needed in the future
  end
  
       def vote
      value = params[:type] == "up" ? 1 : -1
         @movie_theme_comment = MovieThemeComment.find(params[:id])
         @movie_theme_comment.add_or_update_evaluation(:votes, value, current_user)
      redirect_to :back, notice: "thanks for the vote"
   end

  def new
    @movie_theme_comment = MovieThemeComment.new
    respond_with(@movie_theme_comment)
  end

  def edit
  end

    def create
      @movie_theme = MovieTheme.find(params[:movie_theme_id])
      @movie_theme_comment = @movie_theme.movie_theme_comments.create(movie_theme_comment_params)
      @movie_theme_comment.user_id = current_user.id
    
      if @movie_theme_comment.save
        redirect_to# @movie_genre, notice: "thanks for adding a new comment"
    else
      render 'new'
    end
end

  def update
    @movie_theme_comment.update(movie_theme_comment_params)
    respond_with(@movie_theme_comment)
  end

  def destroy
    @movie_theme_comment.destroy
    respond_with(@movie_theme_comment)
  end

  private
  def set_movie_theme_comment
    @movie_theme_comment = MovieThemeComment.find(params[:id])
    end
  
      def set_movie
      @movie = Movie.find(params[:movie_id])
    end
  
  def set_movie_theme
    @movie_theme = MovieTheme.find(params[:movie_theme_id])
    end

  def movie_theme_comment_params
    params.require(:movie_theme_comment).permit(:title, :description)
    end
end

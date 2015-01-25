class MovieGenreCommentsController < ApplicationController
  before_action :set_movie_genre_comment, only: [:show, :edit, :update, :destroy, :votes]
  before_action :set_movie, only: [:index, :create, :new]
  before_action :set_movie_genre, only: [:index, :create, :new]
  before_action :authenticate_user!, except: [:index, :show]
  respond_to :html

  def index
    @movie_genre_comments = MovieGenreComment.popular
    #respond_with(@movie_genre_comments)
  end
 
  
  def show
    # @movie_genre_comments = MovieGenreComment.find_with_reputation(:votes, :all, order: "votes desc")
    # @movie_genre_comment = MovieGenreComment.find(params[:movie_genre_id]) This may be needed in the future
  end
  
       def vote
      value = params[:type] == "up" ? 1 : -1
         @movie_genre_comment = MovieGenreComment.find(params[:id])
         @movie_genre_comment.add_or_update_evaluation(:votes, value, current_user)
      redirect_to :back, notice: "thanks for the vote"
   end

  def new
    @movie_genre_comment = MovieGenreComment.new
    respond_with(@movie_genre_comment)
  end

  def edit
  end

    def create
      @movie_genre = MovieGenre.find(params[:movie_genre_id])
      @movie_genre_comment = @movie_genre.movie_genre_comments.create(movie_genre_comment_params)
      @movie_genre_comment.user_id = current_user.id
    
      if @movie_genre_comment.save
        redirect_to# @movie_genre, notice: "thanks for adding a new comment"
    else
      render 'new'
    end
end

  def update
    @movie_genre_comment.update(movie_genre_comment_params)
    respond_with(@movie_genre_comment)
  end

  def destroy
    @movie_genre_comment.destroy
    respond_with(@movie_genre_comment)
  end

  private
    def set_movie_genre_comment
      @movie_genre_comment = MovieGenreComment.find(params[:id])
    end
  
      def set_movie
      @movie = Movie.find(params[:movie_id])
    end
  
      def set_movie_genre
      @movie_genre = MovieGenre.find(params[:movie_genre_id])
    end

    def movie_genre_comment_params
      params.require(:movie_genre_comment).permit(:title, :description)
    end
end

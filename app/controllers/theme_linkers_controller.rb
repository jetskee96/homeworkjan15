class ThemeLinkersController < ApplicationController
  before_action :set_theme_linker, only: [:show, :edit, :update, :destroy, :votes]
  before_action :set_movie
  before_action :authenticate_user!
  respond_to :html

  def index
    @theme_linkers = ThemeLinker.all
    respond_with(@theme_linkers)
  end

  def show
    @theme_linker = ThemeLinker.find(params[:id])
  end

   def vote
      value = params[:type] == "up" ? 1 : -1
     @theme_linker = ThemeLinker.find(params[:id])
     @theme_linker.add_or_update_evaluation(:votes, value, current_user)
      redirect_to :back, notice: "thanks for the vote"
   end

   
  def new
    @theme_linker = ThemeLinker.new
    respond_with(@theme_linker)
  end

  def edit
  end

  def create
    @theme_linker = ThemeLinker.new(theme_linker_params)
    @theme_linker.user_id = current_user.id
    @theme_linker.movie_id = @movie.id

    if @theme_linker.save
        redirect_to @movie
    else
      render 'new'
    end
  end

  def update
    @theme_linker.update(theme_linker_params)
    respond_with(@theme_linker)
  end

  def destroy
    @theme_linker.destroy
    respond_with(@theme_linker)
  end

  private
  def set_theme_linker
    @theme_linker = ThemeLinker.find(params[:id])
    end
   
   def set_movie
      @movie = Movie.find(params[:movie_id])
   end

  def theme_linker_params
    params.require(:theme_linker).permit(:genre, :description)
    end
end
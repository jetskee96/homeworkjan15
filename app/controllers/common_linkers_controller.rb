class CommonLinkersController < ApplicationController
  before_action :set_common_linker, only: [:show, :edit, :update, :destroy, :votes]
  before_action :set_movie
  before_action :authenticate_user!, except: [:index, :show]
  respond_to :html

  def index
    @common_linkers = CommonLinker.all
    respond_with(@common_linkers)
  end

  def show
    @common_linker = CommonLinker.find(params[:id])
  end

   def vote
      value = params[:type] == "up" ? 1 : -1
     @common_linker = CommonLinker.find(params[:id])
     @common_linker.add_or_update_evaluation(:votes, value, current_user)
      redirect_to :back, notice: "thanks for the vote"
   end

   
  def new
    @common_linker = CommonLinker.new
    respond_with(@common_linker)
  end

  def edit
  end

  def create
    @common_linker = CommonLinker.new(common_linker_params)
    @common_linker.user_id = current_user.id
    @common_linker.movie_id = @movie.id

    if @common_linker.save
        redirect_to @movie
    else
      render 'new'
    end
  end

  def update
    @common_linker.update(common_linker_params)
    respond_with(@common_linker)
  end

  def destroy
    @common_linker.destroy
    respond_with(@common_linker)
  end

  private
  def set_common_linker
    @common_linker = CommonLinker.find(params[:id])
    end
   
   def set_movie
      @movie = Movie.find(params[:movie_id])
   end

  def common_linker_params
    params.require(:common_linker).permit(:cliche, :description)
    end
end
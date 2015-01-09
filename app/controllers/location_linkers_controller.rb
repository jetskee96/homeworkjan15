class LocationLinkersController < ApplicationController
 before_action :set_location_linker, only: [:show, :edit, :update, :destroy, :votes]
  before_action :set_movie
  before_action :authenticate_user!, except: [:index, :show]
  respond_to :html

  def index
    @location_linkers = LocationLinker.all
    respond_with(@location_linkers)
  end

  def show
    @location_linker = LocationLinker.find(params[:id])
  end

   def vote
      value = params[:type] == "up" ? 1 : -1
     @location_linker = LocationLinker.find(params[:id])
     @location_linker.add_or_update_evaluation(:votes, value, current_user)
      redirect_to :back, notice: "thanks for the vote"
   end

   
  def new
    @location_linker = LocationLinker.new
    respond_with(@location_linker)
  end

  def edit
  end

  def create
    @location_linker = LocationLinker.new(location_linker_params)
     @location_linker.user_id = current_user.id
     @location_linker.movie_id = @movie.id

     if @location_linker.save
        redirect_to @movie
    else
      render 'new'
    end
  end

  def update
    @location_linker.update(location_linker_params)
    respond_with(@location_linker)
  end

  def destroy
    @location_linker.destroy
    respond_with(@location_linker)
  end

  private
    def set_location_linker
      @location_linker = LocationLinker.find(params[:id])
    end
   
   def set_movie
      @movie = Movie.find(params[:movie_id])
   end

    def location_linker_params
      params.require(:location_linker).permit(:location, :description)
    end
end

class PlacesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  def index
    @places = Place.all.paginate(:page => params[:page], :per_page => 5)
  end
  
  def new
    @places = Place.new
  end
  
  def create
    current_user.places.create(place_params)
    redirect_to root_path
  end
  
  private
  
  def place_params
    params.require(:place).permit(:name, :address, :description)
  end
end

class AttractionsController < ApplicationController
before_action :attraction_params, only: [:create, :update]
before_action :set_attraction, only: [:show, :edit, :update]

  def show
    @ride = Ride.new
  end

  def new
    @attraction = Attraction.new
  end

  def create
    @attraction = Attraction.new(attraction_params)
    if @attraction.save
      redirect_to attraction_path(@attraction)
    else 
      render 'new'
    end

  end

  def edit
  end

  def update
    @attraction.update(attraction_params)
    if @attraction.save
      redirect_to attraction_path(@attraction)
    else
      render 'edit'
    end
  end

  def index
    @attractions = Attraction.all
  end

private

  def attraction_params
    params.require(:attraction).permit(:name, :min_height, :nausea_rating, :happiness_rating, :tickets)
  end

  def set_attraction
    @attraction = Attraction.find(params[:id])
  end

end

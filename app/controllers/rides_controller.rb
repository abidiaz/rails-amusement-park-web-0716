class RidesController < ApplicationController
before_action :ride_params, only: [:create, :update]
# before_action :other_params, only: [:create, :update]
before_action :set_ride, only: [:show, :edit, :update]

  def show
  end

  def new
    # binding.pry
    # @ride = Ride.new
  end

  def create
    @ride = Ride.create(ride_params)
    # binding.pry
    session[:messages] ||= []
    session[:messages] << @ride.take_ride
    # if @ride.take_ride == "Thanks for riding the #{attraction.name}!"
    # @ride.user.tickets -= @ride.attraction.tickets
    # @ride.user.nausea += @ride.attraction.nausea_rating
    # @ride.user.happiness += @ride.attraction.happiness_rating
    # # @ride.user.password = other_params
    # binding.pry
    # @ride.user.save
    redirect_to user_path(@ride.user)
  end

  def edit
  end

  def update
  end

  def index
    @rides = Ride.all
  end

private

  def ride_params
    params.require(:ride).permit(:user_id, :attraction_id)
  end

  # def other_params
  #   params.require(:user).permit(:password)
  # end

  def set_ride
    @ride = Ride.find(params[:id])
  end

end

class UsersController < ApplicationController
  before_action :user_params, only: [:create, :update]
  before_action :set_user, only: [:show, :edit, :update]
  before_action :authenticate_user, only: [:show, :edit]

  def show
  end

  def new
    @user = User.new
  end

  def create
    # binding.pry
    @user = User.new(user_params)
    if @user.save && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render 'new'
    end
  end

  def authenticate_user
    unless logged_in? == true
      redirect_to root_url_path
    end
  end

  def edit
  end

  def update
    @user.update(user_params)
    if @user.save
      redirect_to user_path(@user)
    else
      render 'edit'
    end
  end

  def index
  end

  private

    def user_params
      params.require(:user).permit(:name, :password, :password_confirmation, :nausea, :happiness, :tickets, :height, :admin, :pic)
    end

    def set_user
      @user = User.find(params[:id])
    end

end

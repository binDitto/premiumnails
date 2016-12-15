class UsersController < ApplicationController
  before_action :set_user, only: [ :edit, :update, :show, :destroy ]

  def index
    @users = User.all

  end

  def new
    @user = User.new()
  end

  def create
    @user = User.create(user_params)

    if @user.save
      flash[:success] = "Welcome to our website #{@user.username}"
      redirect_to user_path(@user)
    else
      flash[:danger] = "Signup failed"
      render 'new'
    end
  end

  def edit

  end

  def update
    if @user.update(user_params)
      flash[:success] = "Your profile is updated"
      redirect_to user_path(@user)
    else
      flash[:danger] = "Your information failed to update"
      render 'edit'
    end
  end

  def show
    @posts = @user.posts.paginate(:page => params[:page], :per_page => 3)
  end

  def destroy
    @user.destroy
    flash[:destroy] = "Nice knowing you"
    redirect_to users_path
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:username, :email, :password)
    end


end

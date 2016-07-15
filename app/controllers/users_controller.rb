class UsersController < ApplicationController


  def new
    @user = User.new
    @photos = Photo.all
  end

  def create
    @user = User.new
    @user.email = params[:user][:email]
    @user.password = params[:user][:password]
    @user.password_confirmation = params[:user][:password_confirmation]
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(id: @user.id)
    else
      render :new
    end
  end

  def show
    @vacation = Vacation.new
    @vacations = Vacation.where("user_id = ?", "#{@current_user.id}")
    @photos = Photo.where("user_id = ?", "#{@current_user.id}")
  end

  def edit
  end

  def update
  end

end

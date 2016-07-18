class Api::UsersController < ApplicationController


  before_action :doorkeeper_authorize!

  protect_from_forgery with: :null_session


  def show
    @vacations = Vacation.find_by id: params[:id]
  end

  def create
  @user = User.create
  @user.username = params[:user][:email]
  @user.password = params[:user][:password]
  if @user.save
    render :user
  else
    render json: @user.errors, status: 422
  end
end

def delete
  @user = User.find_by id: params[:id]
  @user.destroy
  head :ok
end


end
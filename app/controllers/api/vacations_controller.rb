class Api::VacationsController < ApplicationController


  before_action :doorkeeper_authorize!

  protect_from_forgery with: :null_session


  def index
    @users = User.all
  end

  def show
    @vacation = Vacation.find_by id: params[:id]
  end



end

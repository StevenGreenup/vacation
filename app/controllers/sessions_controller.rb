class SessionsController < ApplicationController
  def new
    @photos = Photo.all
  end

  def create
    user = User.find_by email: params[:email]
      if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        redirect_to user_path(id: user.id)
      else
        render:new
      end
  end

  def delete
    session.delete :user_id
    redirect_to root_path, notice: "Signed out."
  end


end

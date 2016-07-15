class PhotosController < ApplicationController
  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.new
    @photo.vacation_id = params[:vacation_id]
    @photo.location = params[:photo][:location]
    @photo.user_id = @current_user.id
    response = Http.get("http://locationiq.org/v1/search.php?key=df45dfb24a963a502257&format=json&q=#{@photo.location}")
    results = JSON.parse(response.body)
    @photo.latitude = results.first["lat"]
    @photo.longitude = results.first["lon"]
    @photo.photo = params[:photo][:photo]
    if @photo.save
      redirect_to user_path(id: @current_user.id)
    else
      render :new
    end
  end



end

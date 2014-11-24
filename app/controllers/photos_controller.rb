class PhotosController < ApplicationController

  def index
    @city = City.find(1)
    @photos = Photo.all.order(id: :desc).page(params[:page]).per(12)
  end

  def show
  end

  private
  def photo_param
  end
end

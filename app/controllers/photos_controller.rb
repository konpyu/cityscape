class PhotosController < ApplicationController
  before_action :set_params, only: [:destroy, :activate]

  def index
    @city = City.find(1)
    @photos = Photo.active.order(id: :desc).page(params[:page]).per(12)
    @photo_count = Photo.active.count
  end

  def destroy
    @photo.destroy
    redirect_to :root
  end

  def standby
    @city = City.find(1)
    @photos = Photo.standby.order(id: :desc).page(params[:page]).per(12)
    @photo_count = Photo.standby.count
  end

  def activate
    @photo.active = true
    @photo.save!
    redirect_to standby_photos_path
  end

  private
  def set_params
    @photo = Photo.find(params[:id])
  end

end

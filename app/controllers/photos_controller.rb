class PhotosController < ApplicationController
  before_action :set_params, only: [:destroy]

  def index
    @city = City.find(1)
    @photos = Photo.active.order(id: :desc).page(params[:page]).per(12)
  end

  def destroy
    @photo.destroy
    redirect_to :root
  end

  private
  def set_params
    @photo = Photo.find(params[:id])
  end

end

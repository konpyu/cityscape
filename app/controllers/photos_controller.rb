class PhotosController < ApplicationController

  def index
    @photos = Photo.all.order(id: :desc).page(params[:page]).per(12)
  end

  def show
  end

  private
  def photo_param
  end
end

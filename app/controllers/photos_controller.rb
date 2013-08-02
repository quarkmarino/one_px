class PhotosController < ApplicationController
  def index
    @photos = Photo.all
  end

  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.new params.require(:photo).permit(:title, :description, :tags)
    if @photo.save
      flash[:notice] = 'A new phoo have been added'
      return redirect_to photos_path
    end

    render :new
  end
end

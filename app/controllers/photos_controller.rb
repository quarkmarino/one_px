class PhotosController < ApplicationController
  def index
    @photos = Photo.all.order 'created_at desc'
  end

  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.new params.require(:photo).permit(:title, :description, :tags, :picture)
    if @photo.save
      flash[:notice] = 'A new phoo have been added'
      return redirect_to photos_path
    end

    render :new
  end

  def edit
    @photo = Photo.find params[:id]
  end

  def update
    @photo = Photo.find params[:id]
    if @photo.update_attributes  params.require(:photo).permit(:title, :description, :tags, :picture)
      flash[:notice] = 'Tu fot ha sido actulizada'
      return redirect_to photos_path
    end

    render :edit
  end
end

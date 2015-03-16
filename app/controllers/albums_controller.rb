class AlbumsController < ApplicationController
  before_action :ensure_login

  def new
    @album = Album.new(band_id: params[:band_id])
  end

  def create
    @album = Album.new(album_params)
    if @album.save
      redirect_to album_url(@album)
    else
      flash.now[:errors] = @album.errors.full_messages
      render :new
    end
  end

  def show
    @album = Album.find(params[:id])
  end

  def edit
    @album = Album.find(params[:id])
  end

  def update
    @album = Album.find(params[:id])
    if @album.update(album_params)
      redirect_to album_url(@album)
    else
      flash.now[:errors] = @album.errors.full_messages
      render :edit
    end
  end

  def destroy
    @album = Album.find(params[:id])
    @album.destroy
    redirect_to band_url(@album.band)
  end

  def album_params
    params[:album].permit(:name, :genre, :band_id)
  end
end

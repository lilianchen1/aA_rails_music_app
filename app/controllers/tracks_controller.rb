class TracksController < ApplicationController
  before_action :ensure_login

  def new
    @track = Track.new(album_id: params[:album_id])
  end

  def create
    album = Album.find(params[:track][:album_id])
    @track = album.tracks.new(track_params)
    if @track.save
      redirect_to track_url(@track)
    else
      flash.now[:errors] = @track.errors.full_messages
      render :new
    end
  end

  def show
    @track = Track.find(params[:id])
  end

  def edit
    @track = Track.find(params[:id])
  end

  def update
    @track = Track.find(params[:id])
    if @track.update(track_params)
      redirect_to track_url(@track)
    else
      flash.now[:errors] = @track.errors.full_messages
      render :edit
    end
  end

  def destroy
    @track = Track.find(params[:id])
    @track.destroy
    redirect_to album_url(@track.album)
  end

  def track_params
    params[:track].permit(:name, :genre, :album_id, :lyrics)
  end
end

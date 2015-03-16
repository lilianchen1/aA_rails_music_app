class NotesController < ApplicationController

  before_action :ensure_creator, only: :destroy

  def create
    @note = Note.new(track_id: params[:track_id], user_id: current_user.id, note: params[:note][:note])
    if @note.save
      redirect_to track_url(@note.track)
    else
      flash[:errors] = @note.errors.full_messages
      redirect_to track_url(@note.track)
    end
  end

  def destroy
    @note = Note.find(params[:id])
    @note.destroy
    redirect_to track_url(@note.track)
  end

  def ensure_creator
    @note = Note.find(params[:id])
    flash[:errors] = ["Only the note's creator can delete this note"]
    redirect_to track_url(@note.track) unless @note.user_id == current_user.id
  end

end

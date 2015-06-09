class SongsController < ApplicationController

  before_action :set_song, only: [:show, :edit, :update, :destroy]

  def index
    @songs = Song.all
  end

  def new
    @song = Song.new
  end

  def show
  end

  def edit 
  end

  def destroy
    @song.destroy
    redirect_to songs_path
  end

  def update
    if @song.update(song_params)
      redirect_to @song
    else
      flash[:errors] = "Please Try Again"
      render :edit
    end
  end

  def create
    @song = Song.new(song_params)
    if @song.save
      redirect_to songs_path(@song)   # Rails is smart enough to also do redirect_to @song
    else
      flash[:errors] = "Please Try Again"
      render :new
    end
  end



  private

  def set_song
    @song = Song.find(params[:id])
  end

  def song_params
    params.require(:song).permit(:title, :artist)
  end

end
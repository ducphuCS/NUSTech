class AlbumsController < ApplicationController
  def edit
    # render "edit"
    @album = Album.find(params[:id])
  end
  def update
    # value = params.permit(album: {:title })
    value = params.require(:album).permit(:title)
    @album = Album.find(params[:id])
    @album.title = value
    @album.save
    redirect_to action: :show
  end
  def show
    @album = Album.find(params[:id])
    render "show"
  end
end

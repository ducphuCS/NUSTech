class AlbumsController < ApplicationController
  def edit
    # render "edit"
    @album = Album.find(params[:id])
  end
  def update
    # value = params.permit(album: {:title })
    # value = params.require(:album).permit(:title)[:title]
    # @album = Album.find(params[:id])
    # @album.update(title: value)
    value = params.require(:album).permit(:title)[:title]
    if value.size >= 10
      Album.find(params[:id]).update(title: value);
      redirect_to action: :show
    else
      flash.now[:title_change_error] = true
      render :error
    end
  end
  def show
    @album = Album.find(params[:id])
    render "show"
  end
end

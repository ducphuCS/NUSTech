class HomeController < ApplicationController
  def index
    redirect_to action: :newest
  end
  def newest
    @albums = Album.order(created_at: :desc).limit(4).select(:id, :title)
    render "newest"
  end
  def discover
    I18n.default_locale = :en
    content_type = get_content
    if content_type == "photo"
      @content = Photo.includes(:user).order(updated_at: :desc)
    else
      @content = Album.includes(:user).order(updated_at: :desc)
    end
  end
  def login

  end
  def get_content
    params.require(:content)
  end
end

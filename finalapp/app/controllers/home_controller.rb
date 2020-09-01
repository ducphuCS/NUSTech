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
  end
  def login

  end
end

class UsersController < ApplicationController
  def create
    @user = User.new(params[:user])
    puts "User create action"

    if @user.save
      UserMailer.welcome_mail(@user).deliver_now
    end
  end
  def show

  end
  def feed

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

  private
  def get_content
    params.require(:content)
  end
end

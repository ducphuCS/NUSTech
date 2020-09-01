class UsersController < ApplicationController
  def create
    @user = User.new(params[:user])
    puts "User create action"

    if @user.save
      UserMailer.welcome_mail(@user).deliver_now
    end
  end
end

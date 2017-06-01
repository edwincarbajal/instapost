class ProfilesController < ApplicationController
  before_action :set_user

  def edit
  end

  def show
    @posts = @user.posts.order('created_at DESC')
  end

  def update
  end

  private

    def set_user
      @user = User.find_by(user_name: params[:user_name])
    end
end

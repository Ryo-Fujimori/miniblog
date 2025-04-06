class UsersController < ApplicationController
  before_action :authenticate_user!, only: %i[create]
  def index
    @users = User.order(id: :desc).limit(10)
  end

  def create
    @user = User.find(params[:id])
    if current_user.follow(@user)
      redirect_to users_index_path
    else
      redirect_to users_index_path, notice: 'フォロー失敗'
    end
  end
end

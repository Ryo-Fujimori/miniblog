class RelationshipsController < ApplicationController
  before_action :authenticate_user!, only: %i[create]

  def create
    @user = User.find(params[:id])
    if current_user.follow(@user)
      redirect_to users_path, notice: 'フォローしました'
    else
      redirect_to users_path, alert: 'フォロー失敗'
    end
  end
end

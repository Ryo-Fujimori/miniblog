class RelationshipsController < ApplicationController
  before_action :authenticate_user!, only: %i[create destroy]

  def create
    user = User.find(params[:user_id])
    if current_user.follow(user)
      redirect_to users_path, notice: 'フォローしました'
    else
      redirect_to users_path, alert: 'フォロー失敗'
    end
  end

  def destroy
    relationship = current_user.active_relationships.find(params[:id])
    relationship.destroy!
    redirect_to users_path, notice: 'フォロー解除しました'
  end
end

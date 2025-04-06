class RelationshipsController < ApplicationController
  before_action :authenticate_user!, only: %i[create]

  # def create →User一覧画面から呼び出す方法が不明のためUserコントローラーで作成
  #   @user = User.find(params[:id])
  #   if current_user.follow(@user)
  #     redirect_to users_index_path
  #   else
  #     redirect_to users_index_path, notice: 'フォロー失敗'
  #   end
  # end
end

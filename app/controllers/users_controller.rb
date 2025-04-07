class UsersController < ApplicationController
  before_action :authenticate_user!, only: %i[index]
  def index
    @users = User.order(id: :desc).limit(10)
  end

end

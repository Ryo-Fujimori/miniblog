class UsersController < ApplicationController
  def index
    @users = User.order(id: :desc).limit(10)
  end
end

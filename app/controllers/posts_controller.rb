class PostsController < ApplicationController
  def index
    @posts = Post.order(:id).limit(10)
  end
end

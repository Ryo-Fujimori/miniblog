class PostsController < ApplicationController
  def index
    @posts = Post.order(:id).limit(10)
    @new_post = Post.new
  end
end

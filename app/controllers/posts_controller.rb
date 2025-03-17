class PostsController < ApplicationController
  def index
    @posts = Post.order(:id).limit(10)
  end

  def new
    @new_post = Post.new
  end

  def create
    @new_post = Post.new(post_params)
    pp @new_post
    @new_post.save
    redirect_to '/'
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end
end

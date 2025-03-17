class PostsController < ApplicationController
  def index
    @posts = Post.order(id: 'DESC').limit(10)
  end

  def new
    @new_post = Post.new
  end

  def create
    @new_post = Post.new(post_params)
    pp @new_post
    @new_post.save
    redirect_to root_path
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to root_path
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end
end

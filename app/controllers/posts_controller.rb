class PostsController < ApplicationController
  before_action :set_post, only: %i[show edit update]
  before_action :authenticate_user!, only: %i[new create edit update]
  before_action :correct_user, only: %i[edit update]

  def index
    @posts = Post.order(id: :desc).limit(10)
  end

  def new
    @post = Post.new
  end

  def show
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to root_path, notice: '投稿作成！'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @post.destroy!
    redirect_to root_path, notice: '削除完了'
    end
  private

  def correct_user
    @user = User.find(@post.user_id)
    redirect_to(root_url, status: :see_other) unless @user == current_user
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:content)
  end
end

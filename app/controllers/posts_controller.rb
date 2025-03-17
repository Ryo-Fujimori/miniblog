class PostsController < ApplicationController
  def index
    @posts = Post.order(id: :desc).limit(10)
  end

  def new
    @new_post = Post.new
  end

  def create
    @new_post = Post.new(post_params)
    if @new_post.save
      redirect_to root_path, notice: '投稿作成！' # ユーザーへの通知を渡せる（viewに出すところはあとでやってみて）
    else
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end
end

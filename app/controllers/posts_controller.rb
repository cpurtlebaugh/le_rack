class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def edit
    @post = Post.find_by(params[:id])
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to posts_path
    else
      render 'new'
    end
  end

  def show
    @post = @post.find(params[:id])
  end

  def destroy
    @post = @post.find_by(params[:id]).destroy
  end

  private

  def post_params
  params.require(:post).permit(:title, :price, :url, :type)
  end

end

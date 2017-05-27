class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :get_posts, only: [:index]

  def index
  end

  def show
  end

  def new
    @post = Post.new
  end

  def edit
  end

  def create
    @post = Post.new(post_params)
    if @post.save 
      flash[:success] = "You post has been created!"
      redirect_to root_path
    else
      flash.now[:alert] = "Your post could not be created! Please check the form."
      render 'new'
    end
  end

  def update
    if @post.update(post_params)
      flash[:success] = "Post updated."
      redirect_to @post
    else
      flash.now[:alert] = "Update failed. Please check the form."
      render 'edit'
    end
  end

  def destroy
    @post.destroy
    flash[:success] = 'Post was successfully deleted.'
    redirect_to root_path
  end

  private

    def get_posts
      @posts = Post.all.sort { |a, b| b.created_at <=> a.created_at }
    end

    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:caption, :image)
    end
end

class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post, only: [:show, :edit, :update, :destroy, :like, :unlike]
  before_action :owned_post, only: [:edit, :update, :destroy]
  before_action :filtered_posts, only: [:index]
  before_action :all_posts, only: [:browse]

  def index
  end

  def show
  end

  def new
    @post = current_user.posts.build
  end

  def edit
  end

  def create
    @post = current_user.posts.build(post_params)
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

  def like
    if @post.liked_by current_user
      respond_to do |format|
        format.html { redirect_to :back }
        format.js
      end
    end
  end

  def unlike
    if @post.unliked_by current_user
      respond_to do |format|
        format.html { redirect_to :back }
        format.js
      end
    end
  end

  def browse
  end

  private

    def all_posts
      @posts = Post.all.order('created_at DESC').page(params[:page])
    end

    def filtered_posts
      @posts = Post.of_current_and_followed_users(current_user.following, current_user)
    end

    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:caption, :image)
    end

    def owned_post
      unless current_user === @post.user
        flash[:alert] = "That post doesn't belong to you!"
        redirect_to root_path
      end
    end
end

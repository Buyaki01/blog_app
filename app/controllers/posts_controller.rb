class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts.includes(:comments)
  end

  def show
    # @post = Post.find(params[:id] )
    @post = User.find(params[:user_id]).posts.includes(:comments).find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @new_post = current_user.posts.new(post_params)
    respond_to do |format|
      format.html do
        if @new_post.save
          redirect_to "/users/#{@new_post.author.id}/posts/", flash: { alert: 'Your post is saved' }
        else
          redirect_to "/users/#{@new_post.author.id}/posts/new", flash: { alert: 'Could not save post' }
        end
      end
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end

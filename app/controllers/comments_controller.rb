class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(text: comment_parameters[:text], author_id: current_user.id, post_id: @post.id)

    respond_to do |format|
      format.html do
        if @comment.save
          redirect_to "/users/#{@post.author_id}/posts/#{@post.id}", flash: { alert: 'Your comment is saved' }
        else
          redirect_to user_post_path(@post.author.id, @post.id), alert: 'An error occured, please try again!'
        end
      end
    end
  end

  private

  def comment_parameters
    params.require(:comment).permit(:text)
  end
end

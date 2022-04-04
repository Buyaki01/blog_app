class LikesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @like = @post.likes.new(author_id: current_user.id, post_id: @post.id)

    respond_to do |format|
      format.html do
        if @like.save
          redirect_to "/users/#{@post.author_id}/posts/#{@post.id}", flash: { alert: 'Your like is saved' }
        else
          redirect_to "/users/#{@post.author_id}/posts/#{@post.id}", flash.now[:error] = 'Could not save like'
        end
      end
    end
  end
end

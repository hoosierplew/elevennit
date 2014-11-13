class CommentsController < ApplicationController
  def create
    post = Post.find params[:comment][:commentable_id]
    comment = Comment.build_from post, current_user.id, comment_params[:body]
    if comment.save
      flash[:notice] = "Thanks for your comment!"
    else
      flash[:error] = "Your comment broke the internet."
    end
    redirect_to post
  end


  private ##########################################################################################

  def comment_params
    params.require(:comment).permit(:body, :commentable_name, :commentable_id)
  end
end

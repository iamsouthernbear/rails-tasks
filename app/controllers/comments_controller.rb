class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    comment = Comment.new(comment_params)

    if comment.save!
      redirect_to article_path(comment[:article_id])
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:user_name, :text, :article_id)
  end
end

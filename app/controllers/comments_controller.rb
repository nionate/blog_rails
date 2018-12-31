class CommentsController < ApplicationController
  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(comment_params)

    # Bad way to do the same
    #@comment = Comment.new(comment_params)
    #@comment.article_id = params[:article_id]
    #@comment.save

    redirect_to article_path(@article)
  end

  private
  def comment_params
    params.require(:comment).permit(:commenter, :body)
  end
end

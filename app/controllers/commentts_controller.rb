
class CommenttsController < ApplicationController
  def create
    @article = Article.find(params[:article_id])
    @commentt = @article.commentts.create(commentt_params)
    redirect_to article_path(@article)
  end
 
  private
    def commentt_params
      params.require(:commentt).permit(:commenter, :body)
    end
end
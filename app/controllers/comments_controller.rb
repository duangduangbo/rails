class CommentsController < ApplicationController
  http_basic_authenticate_with name: "123456", password: "123456", only: :destroy
    def create
        @article = Article.find(params[:article_id])
        
        @comment = @article.comments.new(comment_params)
        @comment.user_id = current_user.id
        @comment.save
        puts "评论"
        # binding.pry

        puts @comment.user_id
        puts @comment.article_id 
        redirect_to article_path(@article)
      end
      def destroy
        @article = Article.find(params[:article_id])
        @comment = @article.comments.find(params[:id])
        @comment.destroy
        redirect_to article_path(@article)
      end
      private
        def comment_params
          params.require(:comment).permit!
        end
end

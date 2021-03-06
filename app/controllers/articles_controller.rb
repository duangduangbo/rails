class ArticlesController < ApplicationController
    http_basic_authenticate_with name: "123456", password: "123456", except: [:index, :show]
    def edit
        @article=Article.find(params[:id])
    end
    def index
        
        @articles = Article.where(user_id: current_user.id)       
        # binding.pry
      
      end
    def show
        @article=Article.find(params[:id])
        # binding.pry
    end

    def new
        @article=Article.new
    
    end
    def create 
        @article=Article.new(article_params)
        @article.user_id = current_user.id

        # binding.pry
        if @article.save #保存到数据库
            # binding.pry
            redirect_to @article
        else
             render 'new'
        end
       
    end
    def update
        @article = Article.find(params[:id])
       
        if @article.update(article_params)
          redirect_to @article
        else
          render 'edit'
        end
      end
      def destroy
        @article = Article.find(params[:id])
        @article.destroy
       
        redirect_to articles_path
      end
    private
        def article_params
            params.require(:article).permit(:title,:text)
        end
end

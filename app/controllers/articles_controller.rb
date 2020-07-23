class ArticlesController < ApplicationController
    before_action :set_article, only: [:show,:edit,:update,:destroy]
    def show
    end

    def index
        @articles=Article.all
    end

    def new
        @article = Article.new     #it is just for validation if it is not done then error occur
    end
    def create
        @article=Article.new(article_params_whitelist)             #  render plain:@article.inspect                      display entered data
        @article.user=User.first
        if @article.save
            flash[:notice] = "Article was created successfully."   #flash hashing is done key value pair
            redirect_to @article
        else
            render 'new'
        end
    end
    def edit
    end
    def update
       if @article.update(article_params_whitelist)
            flash[:notice]="Article updated successfully"
            redirect_to @article
        else
            render 'edit'
       end
    end
    def destroy
        @article.destroy
        redirect_to articles_path
    end

    private
    def set_article
        @article=Article.find(params[:id])
    end
    def article_params_whitelist
        params.require(:article).permit(:title, :description)
    end


end
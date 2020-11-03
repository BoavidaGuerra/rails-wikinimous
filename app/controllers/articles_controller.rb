class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  # R EAD
  # GET /articles
  def index
    @articles = Article.all
  end

  # GET /articles/:id
  def show; end

  # C REATE
  # GET /articles/new
  def new
    @article = Article.new
    # create an empty new instance of Article
    # needed to instantiate the form_for
  end

  def create
    @article = Article.new(article_params)
    @article.save

    redirect_to articles_path
  end

  def edit; end

  def update
    # set_article was already triggered by before_action
    @article.update(article_params)
    @article.save

    redirect_to articles_path
  end

  def destroy
    # set_article was already triggered by before_action
    @article.destroy

    redirect_to articles_path
  end

  private

  def article_params
    params.require(:article).permit(:title, :content)
  end

  def set_article
    @article = Article.find(params[:id])
  end

  # def index
  # end

  # def new
  # end

  # def create
  # end

  # def edit
  # end

  # def update
  # end

  # def destroy
  # end
end

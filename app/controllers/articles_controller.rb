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

    redirect_to article_path(@article.id), alert: "Article was successfully created."
  end

  def edit; end

  def update
    # set_article was already triggered by before_action
    @article.update(article_params)
    @article.save

    redirect_to article_path(@article.id), alert: "Article was successfully updated."
  end

  def destroy
    # set_article was already triggered by before_action
    @article.destroy

    # Need to trigger "Article was successfully destroyed." in index
    redirect_to articles_path, alert: "Article was successfully destroyed."
  end

  private

  def article_params
    params.require(:article).permit(:title, :content)
  end

  def set_article
    @article = Article.find(params[:id])
  end
end

# frozen_string_literal: true

class ArticlesController < ApplicationController
  before_action :find_article, only: [:show, :edit, :update, :destroy]

  def show
  end 
  
  def index
    @articles = Article.paginate(page: params[:page], per_page: 3)
  end 

  def new
    @article = Article.new
  end

  def edit
  end

  def create
    @article = Article.new(article_params)
    @article.user = User.first
    if @article.save
      flash[:notice] = "Article created successfully."
      # redirect_to article_path(@article) # both works
      redirect_to @article # both works
    else
      render "new"
    end
  end

  def update
    if @article.update(article_params)
      flash[:notice] = "Article updated successfully."
      redirect_to article_path(@article)
    else
      render "edit"
    end
  end
  
  def destroy
    @article.destroy
    # flash[:notice] = "Article deleted successfully."
    redirect_to articles_path
  end 

  private

  def find_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :description)
  end

end 
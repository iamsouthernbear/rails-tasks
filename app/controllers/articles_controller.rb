class ArticlesController < ApplicationController
  def index
    @articles = Article.includes(:author, :tags).all

    if params[:tag].present?
      tag = Tag.find_by(name: params[:tag])
      ids = tag.try(:articles).try(:ids) || []
      @articles = @articles.where(id: ids)
    end

    @articles = @articles.order(created_at: :desc).page(params[:page] || 1).per(10)
  end

  def show
    user = current_user
    @article = Article.find(params[:id])
    @comment = Comment.new
    @comments = Comment.where(article_id: @article)
    @user_name = "Anonymus"
    if user
      @user_name = user[:username]
    end
  end
end

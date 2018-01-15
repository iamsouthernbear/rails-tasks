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
    @article = Article.find(params[:id])
  end
end

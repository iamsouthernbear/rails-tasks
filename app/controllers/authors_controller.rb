class AuthorsController < ApplicationController
  def index
    @authors = Author.page(params[:page] || 1).per(10)
  end

  def show
    @author = Author.find(params[:id])
    @articles = Article.where(author: @author).order(created_at: :desc)
  end
end

class AuthorsController < ApplicationController
  before_action :authenticate_user!, :except => [:show, :index]
  
  def index
    @authors = Author.page(params[:page] || 1).per(10)
  end

  def show
    @author = Author.find(params[:id])
    @articles = Article.where(author: @author).order(created_at: :desc)
  end

  def new
    @author = Author.new
  end

  def create
    @author = Author.new(author_params)

    if @author.save!
      redirect_to authors_path
    end
  end

  private
  def author_params
    params.require(:author).permit(:name, :email, :city, :address, :birth_date)
  end
end

class ReportsController < ApplicationController
  def index
    @reports = Dir.glob("*.html")
  end

  def show
    @report = render_to_body file: Dir.glob("#{params[:id]}.html").first
  end
end

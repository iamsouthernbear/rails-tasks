class RequestsController < ApplicationController
  def index
    @requests = Request.all
    @request = Request.new
    @count = @requests.length
    @counter = Russian.p(@count, 'запрос', 'запроса', 'запросов')
    @alert_text = ''
    if @count > 5
      @alert_text = 'Кентуха, успакойса, хватит уже запросов!'
    end
  end

  def create
    @request = Request.create(request_params)
    
    if @request.present?
      redirect_to requests_path
    end
  end

  private
  
  def request_params
    params.require(:request).permit(:text)
  end
end

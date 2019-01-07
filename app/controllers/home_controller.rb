class HomeController < ApplicationController
  def index
    @search = Order.search(params[:q])
    
    @last_orders = Order.last(10)
  end
end

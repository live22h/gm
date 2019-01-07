class PersonsController < ApplicationController
  before_action :authenticate_user!

  def profile
    @search = Order.search(params[:q])

    @my_projects = Order.where(:user_id => current_user)
    @my_works = Specialist.where(:user_id => current_user, :done => 0)
    @specialists = Specialist.where(:order_id => @my_projects, :accepted => 0)
  end
end

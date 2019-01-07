class PersonsController < ApplicationController
  before_action :authenticate_user!

  def profile
    @search = Order.search(params[:q])

    @my_projects = Order.where(:user_id => current_user)
    @my_works = Specialist.where(:user_id => current_user, :done => 0)
    @specialists = Specialist.where(:order_id => @my_projects, :accepted => 0)
  end

  def specialist
    @specialist = Specialist.new(specialist_params)

    respond_to do |format|
      if @specialist.save
        format.html { redirect_to user_root_path }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_specialist
      @specialist = Specialist.new(specialist_params)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def specialist_params
      params.require(:specialist).permit(:order_id, :user_id)
    end
end

class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  # GET /orders
  # GET /orders.json
  def index
    @search = Order.search(params[:q])

    @q = Order.ransack(params[:q])
    @orders = @q.result(distinct: true)
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
    @search = Order.search(params[:q])

    if user_signed_in?
      @message = Message.new
      @message.order = @order
      @message.user = current_user

      @my_specialists = Specialist.where(:order_id => @order, :accepted => 1)

      @specialist = Specialist.new
      @specialist.order = @order
      @specialist.user = current_user
    end
  end

  # GET /orders/new
  def new
    @search = Order.search(params[:q])
    
    @order = Order.new
    @title = 'Создать проект'
  end

  # GET /orders/1/edit
  def edit
    @title = 'Изменить проект'
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(order_params)
    @order.user = current_user
    respond_to do |format|
      if @order.save
        format.html { redirect_to @order, notice: 'Order was successfully created.' }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def message
    @message = Message.new(message_params)
    @order = @message.order
    respond_to do |format|
      if @message.save
        format.html { redirect_to @order }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:theme_id, :deadline, :cost, :picture, :description)
    end

    def message_params
      params.require(:message).permit(:message, :order_id, :user_id)
    end
end

class Api::V1::OrdersController < ApplicationController
  # before_action :authenticate, only: [:create, :update, :destroy]
  before_action :set_order, only: [:show, :update, :destroy]

  # GET /api/v1/orders
  def index
    @orders = Order.all
    render json: OrderSerializer.new(@orders), status: :ok
  end

  # GET /api/v1/orders/1
  def show
    render json: OrderSerializer.new(@order), status: :ok
  end

  # POST /api/v1/orders
  def create
    @order = Order.new(order_params)

    if @order.save
      render json: OrderSerializer.new(@order), status: :created
    end
  end

  # PATCH/PUT /api/v1/orders/1
  def update
    if @order.update(order_params)
      render json: OrderSerializer.new(@order), status: :ok
    end
  end

  # DELETE /api/v1/orders/1
  def destroy
    @order.destroy
    render json: OrderSerializer.new(@order), status: :ok
  end

  private

  def set_order
    @order = Order.find(params[:id])
  end

  def order_params
    params.require(:data).permit(:product_id, :status, :user_id, :total)
  end
end

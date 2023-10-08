class Api::V1::RentsController < ApplicationController
  # before_action :authenticate, only: [:create, :update, :destroy]
  before_action :set_rent, only: [:show, :update, :destroy]

  # GET /api/v1/rents
  def index
    @rents = Rent.all
    render json: RentSerializer.new(@rents), status: :ok
  end

  # GET /api/v1/rents/1
  def show
    render json: RentSerializer.new(@rent), status: :ok
  end

  # POST /api/v1/rents
  def create
    @rent = Rent.new(rent_params)

    if @rent.save
      render json: RentSerializer.new(@rent), status: :created
    end
  end

  # PATCH/PUT /api/v1/rents/1
  def update
    if @rent.update(rent_params)
      render json: RentSerializer.new(@rent), status: :ok
    end
  end

  # DELETE /api/v1/rents/1
  def destroy
    @rent.destroy
    render json: RentSerializer.new(@rent), status: :ok
  end

  def assign_product
    @rent = Rent.find(params[:rent_id])
    @product = Product.find(params[:product_id])

    ActiveRecord::Base.transaction do
      RentProduct.create(rent: @rent, product: @product)
    end

    render json: RentSerializer.new(@rent), status: :ok
  end


  private

  def set_rent
    @rent = Rent.find(params[:id])
  end

  def rent_params
    params.require(:data).permit(:product_id, :user_id, :start_date, :end_date, :status, :price)
  end
end

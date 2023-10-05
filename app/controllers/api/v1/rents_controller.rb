class Api::V1::RentsController < ApplicationController
  before_action :authenticate, only: [:create, :update, :destroy]
  before_action :set_rent, only: [:show, :update, :destroy]

  # GET /api/v1/rents
  def index
    @rents = Rent.all
    render json: @rents, status: :ok
  end

  # GET /api/v1/rents/1
  def show
    render json: @rent, status: :ok
  end

  # POST /api/v1/rents
  def create
    @rent = Rent.new(rent_params)
    debugger
    if @rent.save
      render json: @rent, status: :created
    end
  end

  # PATCH/PUT /api/v1/rents/1
  def update
    if @rent.update(rent_params)
      render json: @rent, status: :ok
    end
  end

  # DELETE /api/v1/rents/1
  def destroy
    @rent.destroy
    render json: @rent, status: :ok
  end

  private

  def set_rent
    @rent = Rent.find(params[:id])
  end

  def rent_params
    params.permit(:product_id, :user_id, :start_date, :end_date, :status, :price)
  end
end

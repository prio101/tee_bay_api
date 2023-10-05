class Api::V1::ProductsController < ApplicationController
  before_action :authenticate, only: [:create, :update, :destroy]
  before_action :set_product, only: [:show, :update, :destroy]

  # GET /api/v1/products
  def index
    @products = Product.all
    render json: @products, status: :ok
  end

  # GET /api/v1/products/1
  def show
    render json: @product, status: :ok
  end

  # POST /api/v1/products
  def create
    @product = Product.new(product_params)
    if @product.save
      render json: @product, status: :created
    end
  end

  # PATCH/PUT /api/v1/products/1
  def update
    if @product.update(product_params)
      render json: @product, status: :ok
    end
  end

  # DELETE /api/v1/products/1
  def destroy
    @product.destroy
    render json: @product, status: :ok
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.permit(:title, :description, :price)
  end
end

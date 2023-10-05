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
      ActiveRecord::Base.transaction do
        @product.images.attach(params[:images])
      end
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

  def assign_category
    @product = Product.find(params[:product_id])
    category_ids = params[:category_ids]

    ActiveRecord::Base.transaction do
      category_ids.each do |category_id|
        @category = Category.find(category_id)
        ProductCategory.create(product: @product, category: @category)
      end
    end

    render json: @product, status: :ok
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.permit(:title, :description, :price, images: [], category_ids: [])
  end
end

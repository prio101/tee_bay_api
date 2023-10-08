class Api::V1::ProductsController < ApplicationController
  # before_action :authenticate, only: [:create, :update, :destroy]
  before_action :set_product, only: [:show, :update, :destroy]

  # GET /api/v1/products
  def index
    @products = SearchService.new(params).call

    render json: ProductSerializer.new(@products), status: :ok
  end

  # GET /api/v1/products/1
  def show
    render json:ProductSerializer.new(@product), status: :ok
  end

  # POST /api/v1/products
  def create
    @product = Product.new(product_params)
    if @product.save
      ActiveRecord::Base.transaction do
        @product.images.attach(params[:images])
      end
      render json: ProductSerializer.new(@product), status: :created
    end
  end

  # PATCH/PUT /api/v1/products/1
  def update
    if @product.update(product_params)
      render json: ProductSerializer.new(@product), status: :ok
    end
  end

  # DELETE /api/v1/products/1
  def destroy
    @product.destroy
    render json: ProductSerializer.new(@product), status: :ok
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

    render json: ProductSerializer.new(@product), status: :ok
  end

  private

  def set_product
    @product = Product.find_by(id: params[:id])
    return if @product.nil? 

    @product
  end

  def product_params
    params.permit(:title, :description, :price, images: [], category_ids: [])
  end
end

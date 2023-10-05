class Api::V1::CategoriesController < ApplicationController
  before_action :authenticate, only: [:create, :update, :destroy]
  before_action :set_category, only: [:show, :update, :destroy]

  # GET /api/v1/categories
  def index
    @categories = Category.all
    render json: { data: @categories }, status: :ok
  end

  # GET /api/v1/categories/1
  def show
    render json: { data: @category }, status: :ok
  end

  # POST /api/v1/categories
  def create
    @category = Category.new(category_params)
    if @category.save
      render json: @category, status: :created
    end
  end

  # PATCH/PUT /api/v1/categories/1
  def update
    if @category.update(category_params)
      render json: @category, status: :ok
    end
  end

  # DELETE /api/v1/categories/1
  def destroy
    @category.destroy
    render json: @category, status: :ok
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end


  def category_params
    params.permit(:name, :description)
  end
end

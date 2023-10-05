class Api::V1::RolesController < ApplicationController
  before_action :authenticate, only: [:create, :update, :destroy]
  before_action :set_role, only: [:show, :update, :destroy]

  # GET /api/v1/roles
  def index
    @roles = Role.all
    render json: @roles, status: :ok
  end

  # GET /api/v1/roles/1
  def show
    render json: @role, status: :ok
  end

  # POST /api/v1/roles
  def create
    @role = Role.new(role_params)
    if @role.save
      render json: @role, status: :created
    end
  end

  # PATCH/PUT /api/v1/roles/1
  def update
    if @role.update(role_params)
      render json: @role, status: :ok
    end
  end

  # DELETE /api/v1/roles/1
  def destroy
    @role.destroy
    render json: @role, status: :ok
  end

  private

  def set_role
    @role = Role.find(params[:id])
  end

  def role_params
    params.permit(:name, :value)
  end
end

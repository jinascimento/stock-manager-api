module V1
  class ProductsController < ApplicationController
    before_action :set_product, only: [:show, :update, :destroy]

    # GET /Products
    def index
      @product = Product.all
      json_response(@product)
    end

    # POST /Products
    def create
      @product = Product.create!(product_params)
      json_response(@product, :created)
    end

    # GET /Products/:id
    def show
      json_response(@product)
    end

    # PUT /Products/:id
    def update
      @product.update(product_params)
      json_response(@product, :created)
    end

    # DELETE /Products/:id
    def destroy
      @product.destroy
      head :no_content
    end

    private

    def product_params
      # whitelist params
      params.permit(:name, :description, :net_weight, :cost_price, :price)
    end

    def set_product
      @product = Product.find(params[:id])
    end
  end
end
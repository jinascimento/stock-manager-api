module V1
  class ProductsController < ApplicationController
    before_action :set_product, only: [:show, :update, :destroy]

    # GET /products
    def index
      @product = Product.all.paginate(page: params[:page],
                                      per_page: params[:per_page])
      json_response(@product)
    end

    # POST /products
    def create
      @product = ProductManager::ProductCreator.call(product_params)
      json_response(@product, :created)
    end

    # GET /products/:id
    def show
      json_response(@product)
    end

    # PUT /products/:id
    def update
      @product = ProductManager::ProductUpdator.call(@product, product_params)
      json_response(@product, :ok)
    end

    # DELETE /products/:id
    def destroy
      ProductManager::ProductDestroyer.call(@product)
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
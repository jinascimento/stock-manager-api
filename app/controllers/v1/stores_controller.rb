module V1
  class StoresController < ApplicationController
    before_action :set_store, only: [:show, :update, :destroy]

    # GET /stores
    def index
      @store = Store.all
      json_response(@store)
    end

    # POST /stores
    def create
      @store_creator = StoreManager::StoreCreator.call(store_params)
      json_response(@store_creator, :created)
    end

    # GET /stores/:id
    def show
      json_response(@store)
    end

    # PUT /stores/:id
    def update
      @store_updator = StoreManager::StoreUpdator.call(@store, store_params)
      json_response(@store_updator, :ok)
    end

    # DELETE /stores/:id
    def destroy
      StoreManager::StoreDestroyer.call(@store)
      head :no_content
    end

    private

    def store_params
      # whitelist params
      params.permit(:name)
    end

    def set_store
      @store = Store.find(params[:id])
    end
  end
end
module V1
  class StoresController < ApplicationController
    before_action :set_store, only: [:show, :update, :destroy]

    # GET /Stores
    def index
      @store = Store.all
      json_response(@store)
    end

    # POST /Stores
    def create
      @store = Store.create!(store_params)
      json_response(@store, :created)
    end

    # GET /Stores/:id
    def show
      json_response(@store)
    end

    # PUT /Stores/:id
    def update
      @store.update(store_params)
      json_response(@store, :created)
    end

    # DELETE /Stores/:id
    def destroy
      @store.destroy
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
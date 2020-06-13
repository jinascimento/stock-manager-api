# frozen_string_literal: true

module V1
  module Stores
    class StockItemsController < ApplicationController
      before_action :set_stock_item, only:
          %i[show update destroy add_units remove_units]

      # GET /stock_items
      def index
        @stock_item = StockItem.all.paginate(page: params[:page],
                                             per_page: params[:per_page])
        json_response(@stock_item)
      end

      # POST /stock_items
      def create
        @stock_item = StockItemManager::StockItemCreator.call(
          store.stock_items.build(stock_item_params).attributes
        )
        json_response(@stock_item, :created)
      end

      # GET /stock_items/:id
      def show
        json_response(@stock_item)
      end

      # PUT /stock_items/:id
      def update
        @stock_item = StockItemManager::StockItemUpdator.call(
          @stock_item, stock_item_params
        )
        json_response(@stock_item, :ok)
      end

      # DELETE /stock_items/:id
      def destroy
        StockItemManager::StockItemDestroyer.call(@stock_item)
        head :no_content
      end

      def add_units
        @stock_item = StockItemManager::StockItemUnitAdder.call(@stock_item,
                                                  params[:quantity])
        json_response(@stock_item, :ok)
      end

      def remove_units
        @stock_item = StockItemManager::StockItemUnitRemover.call(@stock_item,
                                                  params[:quantity])
        json_response(@stock_item, :ok)
      end

      private

      def stock_item_params
        # whitelist params
        params.permit(:remaining_amount, :product_id)
      end

      def store
        @store ||= Store.find(params[:store_id])
      end

      def set_stock_item
        @stock_item = StockItem.where(id: params[:id],
                                      store_id: params[:store_id]).first!
      end
    end
  end
end

module StockItemManager
  class StockItemUpdator < ApplicationService

    def initialize(stock_item, attributes)
      @stock_item = stock_item
      @attributes = attributes
    end

    def call
      @stock_item.update!(@attributes)
      @stock_item
    end
  end
end

module StockItemManager
  class StockItemDestroyer < ApplicationService

    def initialize(stock_item)
      @stock_item = stock_item
    end

    def call
      @stock_item.destroy!
    end
  end
end

module StockItemManager
  class StockItemUnitAdder < ApplicationService

    def initialize(stock_item, units)
      @stock_item = stock_item
      @units = units.to_i
    end

    def call
      @stock_item.with_lock do
        @stock_item.remaining_amount += @units
        @stock_item.save!
        @stock_item
      end
    end
  end
end

module StockItemManager
  class StockItemCreator < ApplicationService

    def initialize(attributes)
      @attributes = attributes
    end

    def call
      stock_item = StockItem.new(@attributes)
      stock_item.save!
      stock_item
    end
  end
end

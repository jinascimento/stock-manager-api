class StockItemSerializer < ActiveModel::Serializer
  attributes :id, :remaining_amount

  belongs_to :product
  belongs_to :store
end

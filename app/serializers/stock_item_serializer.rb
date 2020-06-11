class StockItemSerializer < ActiveModel::Serializer
  attributes :id, :quantity

  belongs_to :product
  belongs_to :store
end

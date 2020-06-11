class StockItemSerializer < ActiveModel::Serializer
  attributes :id, :remaining_amount, :store_id

  belongs_to :product
end

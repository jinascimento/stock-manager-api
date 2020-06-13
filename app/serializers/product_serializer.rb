class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :cost_price, :price, :net_weight

  has_one :stock_item
end

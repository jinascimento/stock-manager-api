class StoreSerializer < ActiveModel::Serializer
  attributes :id, :name

  has_many :stock_items
end

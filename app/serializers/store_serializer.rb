class StoreSerializer < ActiveModel::Serializer
  attributes :id, :name

  has_many :stock_items, if: :stock_items?

  def stock_items?
    object.stock_items.present?
  end
end

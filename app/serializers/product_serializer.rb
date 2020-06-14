class ProductSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :name, :description, :cost_price, :price, :net_weight, :links

  has_one :stock_item do
    link(:related) { v1_store_stock_item_url(object.stock_item.store_id,object.stock_item.id) }
  end
  type :product

  def links
    [
      {
        rel: :self,
        href: v1_product_url(object)
      }
    ]
  end
end

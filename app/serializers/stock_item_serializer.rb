class StockItemSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers

  attributes :id, :remaining_amount, :store_id, :product_id, :links

  belongs_to :product do
    link(:related) { v1_product_url(object.product_id) }
  end
  belongs_to :store do
    link(:related) { v1_store_url(object.store_id) }
  end

  type :stock_item

  def links
    [
      {
        rel: :self,
        href: v1_store_stock_item_url(object.store_id, object.id)
      }
    ]
  end
end

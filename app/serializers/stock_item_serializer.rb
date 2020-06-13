class StockItemSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers

  attributes :id, :remaining_amount, :store_id, :product_id, :links

  belongs_to :product
  belongs_to :store
  type :stock_item

  def links
    [
      {
        rel: :self,
        href: v1_store_stock_item_path(object.store_id, object.id)
      }
    ]
    # next v1_store_stock_items_path(object.store_id, object.id)
  end
end

class StoreSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :name, :links

  has_many :stock_items do
    link(:related) { v1_store_stock_items_url(object.id) }
  end

  def links
    [
      {
        rel: :self,
        href: v1_store_url(object)
      }
    ]
  end
end

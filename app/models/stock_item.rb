class StockItem < ApplicationRecord
  belongs_to :store, required: true
  belongs_to :product, required: true

  validates :quantity, presence: true

  accepts_nested_attributes_for :product
end

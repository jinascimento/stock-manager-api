class StockItem < ApplicationRecord
  belongs_to :store, required: true
  has_one :product, required: true

  validates :quantity, presence: true

  accepts_nested_attributes_for :product
end

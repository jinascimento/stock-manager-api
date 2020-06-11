class StockItem < ApplicationRecord
  belongs_to :store, required: true
  belongs_to :product, required: true

  validates :remaining_amount, presence: true
  validates :remaining_amount, numericality: { greater_than_or_equal_to: 0 }

  accepts_nested_attributes_for :product
end

class Product < ApplicationRecord
  has_one :stock_item, dependent: :destroy

  validates :name, presence: true
  validates :cost_price, presence: true
  validates :price, presence: true
end

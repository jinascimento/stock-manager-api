class Product < ApplicationRecord
  belongs_to :stock_item

  validates :name, presence: true
  validates :cost_price, presence: true
  validates :price, presence: true
end

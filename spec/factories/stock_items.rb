FactoryBot.define do
  factory :stock_item do
    quantity { 1 }
    store
    product
  end
end
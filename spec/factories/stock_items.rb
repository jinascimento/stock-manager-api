FactoryBot.define do
  factory :stock_item do
    remaining_amount { 1 }
    store
    product
  end
end
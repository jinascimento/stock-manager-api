FactoryBot.define do
  factory :stock_item do
    quantity { Faker::Number.number(digits: 2) }
    store
    product
  end
end
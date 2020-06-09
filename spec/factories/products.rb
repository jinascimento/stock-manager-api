FactoryBot.define do
  factory :product do
    name { 'Sabonete' }
    description { 'Sabonete antialérgico' }
    net_weight { 100 }
    cost_price { 1.20 }
    price { 2.00 }
    stock_item
  end
end
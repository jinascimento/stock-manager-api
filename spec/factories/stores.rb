FactoryBot.define do
  factory :store do
    name { Faker::Name.name }
    stock_item
  end
end
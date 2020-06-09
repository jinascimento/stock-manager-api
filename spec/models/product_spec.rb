require 'rails_helper'

RSpec.describe Product, type: :model do
  context 'associations' do
    it { should have_one(:stock_item) }
  end

  context 'validations' do
    it { should validate_presence_of(:name) }
  end

end
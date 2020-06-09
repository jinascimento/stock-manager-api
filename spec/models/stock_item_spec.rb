require 'rails_helper'

RSpec.describe StockItem, type: :model do
  context 'associations' do
    it { should have_one(:product) }
    it { should belong_to(:store) }
  end

  context 'validations' do
    it { should validate_presence_of(:quantity) }
  end

end
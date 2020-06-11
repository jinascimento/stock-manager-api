require 'rails_helper'

RSpec.describe StockItem, type: :model do
  context 'associations' do
    it { should belong_to(:store) }
    it { should belong_to(:product) }
  end

  context 'validations' do
    it { should validate_presence_of(:remaining_amount) }
  end

end
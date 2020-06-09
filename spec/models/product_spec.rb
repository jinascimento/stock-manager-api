require 'rails_helper'

RSpec.describe Product, type: :model do
  context 'associations' do
    it { should belong_to(:stock_item) }
  end

  context 'validations' do
    it { should validate_presence_of(:name) }
  end

end
require 'rails_helper'

RSpec.describe Store, type: :model do
  context 'associations' do
    it { should have_many(:stock_items).dependent(:destroy) }
  end

  context 'validations' do
    it { should validate_presence_of(:name) }
  end

end
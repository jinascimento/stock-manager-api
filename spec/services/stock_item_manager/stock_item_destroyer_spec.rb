require 'rails_helper'

RSpec.describe StockItemManager::StockItemDestroyer, type: :service do
  describe '#call' do
    context 'when found stock_item' do
      it 'returns true' do
        stock_item = FactoryBot.create(:stock_item)

        result = described_class.call(stock_item)
        expect(result).to be_truthy
      end
    end
  end

end
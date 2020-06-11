require 'rails_helper'

RSpec.describe StockItemManager::StockItemUpdator, type: :service do
  describe '#call' do
    context 'when valid stock_item' do
      it 'returns stock_item object updated' do
        stock_item = FactoryBot.create(:stock_item)
        attributes = { remaining_amount: 3 }

        result = described_class.call(stock_item, attributes)
        expect(result.remaining_amount).to eq(attributes[:remaining_amount])
      end
    end

    context 'when invalid attributes' do
      it 'return exception' do
        stock_item = FactoryBot.create(:stock_item)
        attributes = { remaining_amount: nil }

        expect { described_class.call(stock_item, attributes) }
            .to raise_error(ActiveRecord::RecordInvalid)
      end
    end
  end

end
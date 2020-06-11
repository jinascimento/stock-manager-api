require 'rails_helper'

RSpec.describe StockItemManager::StockItemUnitRemover, type: :service do
  describe '#call' do
    context 'when have items in stock item' do
      it 'returns stock_item with less items' do
        stock_item = FactoryBot.create(:stock_item, remaining_amount: 1)
        quantity = 1

        expect { described_class.call(stock_item, quantity) }
          .to change(stock_item, :remaining_amount).by(-1)
      end
    end

    context 'when not have items in stock item' do
      it 'return validation error' do
        stock_item = FactoryBot.create(:stock_item, remaining_amount: 1)
        quantity = 2

        expect { described_class.call(stock_item, quantity) }
          .to raise_error(ActiveRecord::RecordInvalid)
      end
    end
  end

end
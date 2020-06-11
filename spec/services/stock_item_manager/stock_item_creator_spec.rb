require 'rails_helper'

RSpec.describe StockItemManager::StockItemCreator, type: :service do
  describe '#call' do
    context 'when valid stock_item' do
      it 'returns stock_item object persisted' do
        product = FactoryBot.create(:product)
        store = FactoryBot.create(:store)
        stock_item = FactoryBot.attributes_for(:stock_item,
                                               store_id: store.id,
                                               product_id: product.id)
        result = described_class.call(stock_item)

        expect(result.persisted?).to be_truthy
      end
    end

    context 'when invalid stock_item' do
      it 'return exception' do
        stock_item = FactoryBot.attributes_for(:stock_item, product_id: nil)
        expect { described_class.call(stock_item) }
          .to raise_error(ActiveRecord::RecordInvalid)
      end
    end
  end

end
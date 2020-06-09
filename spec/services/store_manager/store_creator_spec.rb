require 'rails_helper'

RSpec.describe StoreManager::StoreCreator, type: :service do
  describe '#call' do
    context 'when valid store' do
      it 'returns store object persisted' do
        store = FactoryBot.attributes_for(:store)
        result = described_class.call(store)

        expect(result.persisted?).to be_truthy
      end
    end

    context 'when invalid store' do
      it 'return exception' do
        store = FactoryBot.attributes_for(:store, name: nil)
        expect { described_class.call(store) }
          .to raise_error(ActiveRecord::RecordInvalid)
      end
    end
  end

end
require 'rails_helper'

RSpec.describe StoreManager::StoreUpdator, type: :service do
  describe '#call' do
    context 'when valid store' do
      it 'returns store object updated' do
        store = FactoryBot.create(:store)
        attributes = { name: Faker::Name.name }

        result = described_class.call(store, attributes)
        expect(result.name).to eq(attributes[:name])
      end
    end

    context 'when invalid attributes' do
      it 'return exception' do
        store = FactoryBot.create(:store)
        attributes = { name: nil }

        expect { described_class.call(store, attributes) }
            .to raise_error(ActiveRecord::RecordInvalid)
      end
    end
  end

end
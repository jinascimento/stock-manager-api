require 'rails_helper'

RSpec.describe StoreManager::StoreDestroyer, type: :service do
  describe '#call' do
    context 'when found store' do
      it 'returns true' do
        store = FactoryBot.create(:store)

        result = described_class.call(store)
        expect(result).to be_truthy
      end
    end
  end

end
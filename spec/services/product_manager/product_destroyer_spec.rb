require 'rails_helper'

RSpec.describe ProductManager::ProductDestroyer, type: :service do
  describe '#call' do
    context 'when found product' do
      it 'returns true' do
        product = FactoryBot.create(:product)

        result = described_class.call(product)
        expect(result).to be_truthy
      end
    end
  end

end
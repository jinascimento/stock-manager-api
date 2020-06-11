require 'rails_helper'

RSpec.describe ProductManager::ProductCreator, type: :service do
  describe '#call' do
    context 'when valid product' do
      it 'returns product object persisted' do
        product = FactoryBot.attributes_for(:product)
        result = described_class.call(product)

        expect(result.persisted?).to be_truthy
      end
    end

    context 'when invalid product' do
      it 'return exception' do
        product = FactoryBot.attributes_for(:product, name: nil)
        expect { described_class.call(product) }
          .to raise_error(ActiveRecord::RecordInvalid)
      end
    end
  end

end
require 'rails_helper'

RSpec.describe ProductManager::ProductUpdator, type: :service do
  describe '#call' do
    context 'when valid product' do
      it 'returns product object updated' do
        product = FactoryBot.create(:product)
        attributes = { name: Faker::Name.name }

        result = described_class.call(product, attributes)
        expect(result.name).to eq(attributes[:name])
      end
    end

    context 'when invalid attributes' do
      it 'return exception' do
        product = FactoryBot.create(:product)
        attributes = { name: nil }

        expect { described_class.call(product, attributes) }
            .to raise_error(ActiveRecord::RecordInvalid)
      end
    end
  end

end
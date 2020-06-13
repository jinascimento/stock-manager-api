# frozen_string_literal: true

require 'swagger_helper'

describe 'Products API' do
  path '/v1/products' do
    post 'Create a product' do
      tags 'Products'
      consumes 'application/json'
      parameter name: :product, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          description: { type: :string },
          cost_price: { type: :number },
          price: { type: :number },
          net_weight: { type: :string }
        },
        required: %w[name cost_price price]
      }

      response '201', 'created' do
        schema type: :object,
               properties: {
                 id: { type: :integer },
                 name: { type: :string },
                 description: { type: :string },
                 cost_price: { type: :string },
                 price: { type: :string },
                 net_weight: { type: :number },
                 created_at: { type: :string },
                 updated_at: { type: :string }
               },
               required: %w[id]

        let(:product) { FactoryBot.create(:product) }
        run_test!
      end

      response '422', 'Unprocessable Entity' do
        schema type: :object,
               properties: {
                 message: { type: :string }
               }

        let(:product) { { name: nil } }
        run_test!
      end
    end

    get 'List all products' do
      tags 'Products'
      consumes 'application/json'
      parameter name: :page, in: :query, type: :string
      parameter name: :per_page, in: :query, type: :string

      response '200', 'OK' do
        schema type: :array,
               items: {
                 properties: {
                   id: { type: :integer },
                   name: { type: :string },
                   description: { type: :string },
                   cost_price: { type: :string },
                   price: { type: :string },
                   net_weight: { type: :string },
                   created_at: { type: :string },
                   updated_at: { type: :string }
                 }
               }
        FactoryBot.create_list(:product, 2)
        run_test!
      end
    end
  end

  path '/v1/products/{id}' do
    put 'Update a product' do
      tags 'Products'
      consumes 'application/json'
      parameter name: :id, in: :path, type: :string
      parameter name: :product, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          description: { type: :string },
          cost_price: { type: :number },
          price: { type: :number },
          net_weight: { type: :integer }
        },
        required: %w[name cost_price price]
      }

      response '200', 'OK' do
        schema type: :object,
               properties: {
                 name: { type: :string },
                 description: { type: :string },
                 cost_price: { type: :string },
                 price: { type: :string },
                 net_weight: { type: :number },
                 created_at: { type: :string },
                 updated_at: { type: :string }
               },
               required: %w[id]

        let(:product) { FactoryBot.create(:product) }
        let(:id) { product.id }
        run_test!
      end

      response '422', 'Unprocessable Entity' do
        schema type: :object,
               properties: {
                 message: { type: :string }
               }

        let(:product_create) { FactoryBot.create(:product) }
        let(:product) { { name: nil } }
        let(:id) { product_create.id }
        run_test!
      end
    end

    get 'Retrieves a product' do
      tags 'Products'
      consumes 'application/json'
      parameter name: :id, in: :path, type: :string

      response '200', 'OK' do
        schema type: :object,
               properties: {
                 name: { type: :string },
                 description: { type: :string },
                 cost_price: { type: :string },
                 price: { type: :string },
                 net_weight: { type: :number },
                 created_at: { type: :string },
                 updated_at: { type: :string }
               },
               required: %w[id]

        let(:id) { FactoryBot.create(:product).id }

        run_test!
      end

      response '404', 'Not Found' do
        schema type: :object,
               properties: {
                 message: { type: :string }
               }

        let(:id) { 0 }

        run_test!
      end
    end

    delete 'Destroy a product' do
      tags 'Products'
      consumes 'application/json'
      parameter name: :id, in: :path, type: :string

      response '204', 'No content' do
        let(:id) { FactoryBot.create(:product).id }

        run_test!
      end

      response '404', 'Not Found' do
        schema type: :object,
               properties: {
                 message: { type: :string }
               }

        let(:id) { 0 }

        run_test!
      end
    end
  end
end

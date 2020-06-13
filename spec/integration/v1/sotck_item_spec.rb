# frozen_string_literal: true

require 'swagger_helper'

describe 'StockItems API' do
  path '/v1/stores/{store_id}/stock_items' do
    post 'Create a stock_item' do
      tags 'StockItems'
      consumes 'application/json'
      parameter name: :store_id, in: :path, type: :string
      parameter name: :stock_item, in: :body, schema: {
        type: :object,
        properties: {
          remaining_amount: { type: :integer },
          product_id: { type: :integer }
        },
        required: %w[remaining_amount product_id store_id]
      }

      response '201', 'created' do
        schema type: :object,
               properties: {
                 id: { type: :integer },
                 remaining_amount: { type: :integer },
                 store_id: { type: :integer },
                 product_id: { type: :ineger },
                 created_at: { type: :string },
                 updated_at: { type: :string },
                 product: { type: :object,
                            properties: {
                              id: { type: :integer },
                              name: { type: :string },
                              description: { type: :string },
                              cost_price: { type: :string },
                              price: { type: :string },
                              net_weight: { type: :integer },
                              created_at: { type: :string },
                              updated_at: { type: :string }
                           }
                 }
               },
               required: %w[store_id]

        let(:stock_item) { FactoryBot.create(:stock_item) }
        let(:store_id) { stock_item.store_id }
        run_test!
      end

      response '422', 'Unprocessable Entity' do
        schema type: :object,
               properties: {
                 message: { type: :string }
               }

        let(:stock_item_create) { FactoryBot.create(:stock_item) }
        let(:stock_item) { { name: nil } }
        let(:store_id) { stock_item_create.store_id }
        run_test!
      end
    end

    get 'List all stock_items' do
      tags 'StockItems'
      consumes 'application/json'
      parameter name: :store_id, in: :path, type: :string
      parameter name: :page, in: :query, type: :string
      parameter name: :per_page, in: :query, type: :string

      response '200', 'OK' do
        schema type: :array,
               items: {
                 properties: {
                   id: { type: :integer },
                   name: { type: :string },
                   description: { type: :string },
                   cost_price: { type: :number },
                   price: { type: :number },
                   net_weight: { type: :integer },
                   created_at: { type: :string },
                   updated_at: { type: :string }
                   }
               }

        let(:stock_item) { FactoryBot.create(:stock_item) }
        let(:store_id) { stock_item.store_id }
        run_test!
      end
    end
  end

  path '/v1/stores/{store_id}/stock_items/{id}' do
    put 'Update a stock_item' do
      tags 'StockItems'
      consumes 'application/json'
      parameter name: :store_id, in: :path, type: :string
      parameter name: :id, in: :path, type: :string
      parameter name: :stock_item, in: :body, schema: {
        type: :object,
        properties: {
          remaining_amount: { type: :integer },
          product_id: { type: :integer }
        },
        required: %w[remaining_amount product_id store_id]
      }

      response '200', 'OK' do
        schema type: :object,
               properties: {
                 id: { type: :integer },
                 remaining_amount: { type: :integer },
                 store_id: { type: :integer },
                 product_id: { type: :ineger },
                 created_at: { type: :string },
                 updated_at: { type: :string },
                 product: { type: :object,
                            properties: {
                              id: { type: :integer },
                              name: { type: :string },
                              description: { type: :string },
                              cost_price: { type: :string },
                              price: { type: :string },
                              net_weight: { type: :integer },
                              created_at: { type: :string },
                              updated_at: { type: :string }
                            }
                 }
               },
               required: %w[store_id]

        let(:stock_item) { FactoryBot.create(:stock_item) }
        let(:id) { stock_item.id }
        let(:store_id) { stock_item.store_id }
        run_test!
      end

      response '422', 'Unprocessable Entity' do
        schema type: :object,
               properties: {
                   message: { type: :string }
               }

        let(:stock_item_create) { FactoryBot.create(:stock_item) }
        let(:stock_item) { { product_id: nil } }
        let(:id) { stock_item_create.id }
        let(:store_id) { stock_item_create.store_id }
        run_test!
      end

      response '404', 'Not Found' do
        schema type: :object,
               properties: {
                   message: { type: :string }
               }

        let(:stock_item_create) { FactoryBot.create(:stock_item) }
        let(:stock_item) { { product_id: nil } }
        let(:store_id) { stock_item_create.store_id }
        let(:id) { 0 }

        run_test!
      end
    end

    get 'Retrieves a stock_item' do
      tags 'StockItems'
      consumes 'application/json'
      parameter name: :store_id, in: :path, type: :string
      parameter name: :id, in: :path, type: :string

      response '200', 'OK' do
        schema type: :object,
               properties: {
                 id: { type: :integer },
                 remaining_amount: { type: :integer },
                 store_id: { type: :integer },
                 product_id: { type: :ineger },
                 created_at: { type: :string },
                 updated_at: { type: :string },
                 product: { type: :object,
                            properties: {
                              id: { type: :integer },
                              name: { type: :string },
                              description: { type: :string },
                              cost_price: { type: :string },
                              price: { type: :string },
                              net_weight: { type: :integer },
                              created_at: { type: :string },
                              updated_at: { type: :string }
                            }
                 }
               },
               required: %w[store_id id]

        let(:stock_item_create) { FactoryBot.create(:stock_item) }
        let(:id) { stock_item_create.id }
        let(:store_id) { stock_item_create.store_id }

        run_test!
      end

      response '404', 'Not Found' do
        schema type: :object,
               properties: {
                 message: { type: :string }
               }

        let(:stock_item_create) { FactoryBot.create(:stock_item) }
        let(:id) { 0 }
        let(:store_id) { stock_item_create.store_id }

        run_test!
      end
    end

    delete 'Destroy a stock_item' do
      tags 'StockItems'
      consumes 'application/json'
      parameter name: :store_id, in: :path, type: :string
      parameter name: :id, in: :path, type: :string

      response '204', 'No content' do
        let(:stock_item_create) { FactoryBot.create(:stock_item) }
        let(:id) { stock_item_create.id }
        let(:store_id) { stock_item_create.store_id }

        run_test!
      end

      response '404', 'Not Found' do
        schema type: :object,
               properties: {
                 message: { type: :string }
               }

        let(:stock_item_create) { FactoryBot.create(:stock_item) }
        let(:id) { 0 }
        let(:store_id) { stock_item_create.store_id }

        run_test!
      end
    end
  end

  path '/v1/stores/{store_id}/stock_items/{id}/add_units' do
    put 'Add items in stock' do
      tags 'StockItems'
      consumes 'application/json'
      parameter name: :store_id, in: :path, type: :string
      parameter name: :id, in: :path, type: :string
      parameter name: :stock_item, in: :body, schema: {
        type: :object,
        properties: {
          quantity: { type: :integer }
        },
        required: %w[quantity product_id store_id]
      }

      response '200', 'OK' do
        schema type: :object,
               properties: {
                 id: { type: :integer },
                 remaining_amount: { type: :integer },
                 store_id: { type: :integer },
                 product_id: { type: :ineger },
                 created_at: { type: :string },
                 updated_at: { type: :string },
                 product: { type: :object,
                            properties: {
                              id: { type: :integer },
                              name: { type: :string },
                              description: { type: :string },
                              cost_price: { type: :string },
                              price: { type: :string },
                              net_weight: { type: :integer },
                              created_at: { type: :string },
                              updated_at: { type: :string }
                            }
                 }
               },
               required: %w[store_id]

        let(:stock_item) { FactoryBot.create(:stock_item) }
        let(:id) { stock_item.id }
        let(:store_id) { stock_item.store_id }
        run_test!
      end

      response '404', 'Not Found' do
        schema type: :object,
               properties: {
                   message: { type: :string }
               }

        let(:stock_item) { FactoryBot.create(:stock_item) }
        let(:id) { 0 }
        let(:store_id) { stock_item.store_id }

        run_test!
      end
    end
  end

  path '/v1/stores/{store_id}/stock_items/{id}/remove_units' do
    put 'Add items in stock' do
      tags 'StockItems'
      consumes 'application/json'
      parameter name: :store_id, in: :path, type: :string
      parameter name: :id, in: :path, type: :string
      parameter name: :stock_item, in: :body, schema: {
        type: :object,
        properties: {
          quantity: { type: :integer }
        },
        required: %w[quantity product_id store_id]
      }

      response '200', 'OK' do
        schema type: :object,
               properties: {
                   id: { type: :integer },
                   remaining_amount: { type: :integer },
                   store_id: { type: :integer },
                   product_id: { type: :ineger },
                   created_at: { type: :string },
                   updated_at: { type: :string },
                   product: { type: :object,
                              properties: {
                                  id: { type: :integer },
                                  name: { type: :string },
                                  description: { type: :string },
                                  cost_price: { type: :string },
                                  price: { type: :string },
                                  net_weight: { type: :integer },
                                  created_at: { type: :string },
                                  updated_at: { type: :string }
                              }
                   }
               },
               required: %w[store_id]

        let(:stock_item) { FactoryBot.create(:stock_item) }
        let(:id) { stock_item.id }
        let(:store_id) { stock_item.store_id }
        run_test!
      end

      response '404', 'Not Found' do
        schema type: :object,
               properties: {
                   message: { type: :string }
               }

        let(:stock_item) { FactoryBot.create(:stock_item) }
        let(:id) { 0 }
        let(:store_id) { stock_item.store_id }

        run_test!
      end
    end
  end
end

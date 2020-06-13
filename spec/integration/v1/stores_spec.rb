# frozen_string_literal: true

require 'swagger_helper'

describe 'Stores API' do
  path '/v1/stores' do
    post 'Create a store' do
      tags 'Stores'
      consumes 'application/json'
      parameter name: :store, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string }
        },
        required: ['name']
      }

      response '201', 'created' do
        schema type: :object,
               properties: {
                 data: {
                   type: :object,
                   properties: {
                     id: { type: :string },
                     type: { type: :string },
                     attributes: { type: :object,
                                   properties: {
                                     name: { type: :string },
                                   }
                     }
                   }
                 }
               }

        let(:store) { FactoryBot.create(:store) }
        run_test!
      end

      response '422', 'Unprocessable Entity' do
        schema type: :object,
               properties: {
                 message: { type: :string }
               }


        let(:store) { { name: nil }}
        run_test!
      end
    end

    get 'List all stores' do
      tags 'Stores'
      consumes 'application/json'
      parameter name: :'page[number]', in: :query, type: :string
      parameter name: :'page[size]', in: :query, type: :string

      response '200', 'OK' do
        schema type: :object,
               properties: {
                 data: {
                   type: :array,
                   items: {
                     properties: {
                       id: { type: :string },
                       type: { type: :string },
                       attributes: { type: :object,
                                     properties: {
                                       name: { type: :string }
                                     }
                       }
                     }
                   }
                 }
               }
        FactoryBot.create(:store)
        let(:'page[number]') { 1 }
        let(:'page[size]') { 2 }

        run_test!
      end
    end
  end

  path '/v1/stores/{id}' do
    put 'Update a store' do
      tags 'Stores'
      consumes 'application/json'
      parameter name: :id, in: :path, type: :string
      parameter name: :store, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string }
        },
        required: ['name']
      }

      response '200', 'OK' do
        schema type: :object,
               properties: {
                 data: {
                   type: :object,
                   properties: {
                     id: { type: :string },
                     type: { type: :string },
                     attributes: { type: :object,
                                   properties: {
                                     id: { type: :string },
                                     name: { type: :string }
                                   }
                     }
                   }
                 }
               }

        let(:store) { FactoryBot.create(:store) }
        let(:id) { store.id }
        run_test!
      end

      response '422', 'Unprocessable Entity' do
        schema type: :object,
               properties: {
                   message: { type: :string }
               }


        let(:store_create) { FactoryBot.create(:store) }
        let(:store) { { name: nil }}
        let(:id) { store_create.id }
        run_test!
      end
    end

    get 'Retrieves a store' do
      tags 'Stores'
      consumes 'application/json'
      parameter name: :id, in: :path, type: :string

      response '200', 'OK' do
        schema type: :object,
               properties: {
                 data: {
                   type: :object,
                   properties: {
                     id: { type: :string },
                     type: { type: :string },
                     attributes: { type: :object,
                                   properties: {
                                     name: { type: :string }
                                   }
                     }
                  }
                 }
               }

        let(:id) { FactoryBot.create(:store).id }

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

    delete 'Destroy a store' do
      tags 'Stores'
      consumes 'application/json'
      parameter name: :id, in: :path, type: :string

      response '204', 'No content' do

        let(:id) { FactoryBot.create(:store).id }

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

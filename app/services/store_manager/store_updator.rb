module StoreManager
  class StoreUpdator < ApplicationService

    def initialize(store, attributes)
      @store = store
      @attributes = attributes
    end

    def call
      @store.update!(@attributes)
      @store
    end
  end
end

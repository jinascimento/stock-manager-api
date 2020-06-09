module StoreManager
  class StoreDestroyer < ApplicationService

    def initialize(store)
      @store = store
    end

    def call
      @store.destroy!
    end
  end
end

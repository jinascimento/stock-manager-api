module StoreManager
  class StoreCreator < ApplicationService

    def initialize(attributes)
      @attributes = attributes
    end

    def call
      store = Store.new(@attributes)
      store.save!
      store
    end
  end
end

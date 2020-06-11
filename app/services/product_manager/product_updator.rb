module ProductManager
  class ProductUpdator < ApplicationService

    def initialize(product, attributes)
      @product = product
      @attributes = attributes
    end

    def call
      @product.update!(@attributes)
      @product
    end
  end
end

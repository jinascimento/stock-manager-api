module ProductManager
  class ProductDestroyer < ApplicationService

    def initialize(product)
      @product = product
    end

    def call
      @product.destroy!
    end
  end
end

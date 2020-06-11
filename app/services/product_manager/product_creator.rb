module ProductManager
  class ProductCreator < ApplicationService

    def initialize(attributes)
      @attributes = attributes
    end

    def call
      product = Product.new(@attributes)
      product.save!
      product
    end
  end
end

module Spree
  module Customization::ProductConcerns
    extend ActiveSupport::Concern

    included do
      prepend(InstanceMethods)
    end

    module InstanceMethods
      def duplicate_extra(product)
        product.customization
      end
    end
  end
end
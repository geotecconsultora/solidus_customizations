module Spree
  module Customization::Configurable
    extend ActiveSupport::Concern

    included do
      prepend(InstanceMethods)
    end

    module InstanceMethods
      def virtual_proofable?
        virtual_proofable
      end
    end

  end
end
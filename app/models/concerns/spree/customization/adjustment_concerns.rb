module Spree
  module Customization::AdjustmentConcerns
    extend ActiveSupport::Concern

    included do
      scope :customization, -> { where(source_type: 'Spree::DesignOption') }

      prepend(InstanceMethods)
    end

    module InstanceMethods

      # @return [Boolean] true when this is a customization adjustment (Customization adjustments have a {DesignConfiguration} source)
      def customization?
        source_type == 'Spree::DesignOption'
      end
    end
  end
end

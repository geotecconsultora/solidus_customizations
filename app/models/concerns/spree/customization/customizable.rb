module Spree
  module Customization::Customizable
    extend ActiveSupport::Concern

    included do
      has_many :customizations, as: :customizable, class_name: 'Spree::ItemCustomization'
      accepts_nested_attributes_for :customizations, reject_if: :duplicate_configuration

      prepend(InstanceMethods)
    end

    module InstanceMethods
      def duplicate_configuration(attributes)
        !!customizations.any? { |customization| customization.configuration_id == attributes.with_indifferent_access[:configuration_id].to_i }
      end
    end
  end
end
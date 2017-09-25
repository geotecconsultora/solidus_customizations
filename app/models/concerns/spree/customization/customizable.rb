module Spree
  module Customization::Customizable
    extend ActiveSupport::Concern

    included do
      has_many :customizations, as: :customizable, class_name: 'Spree::ItemCustomization', dependent: :destroy
      accepts_nested_attributes_for :customizations, reject_if: :duplicate_configuration

      prepend(InstanceMethods)
    end

    module InstanceMethods

      def discounted_amount
        super + customization_total
      end

      def duplicate_configuration(attributes)
        !!customizations.any? { |customization| customization.configuration_id == attributes.with_indifferent_access[:configuration_id].to_i }
      end

      # Need to also check for configuration_type
      # *Add test*
      # def duplicate_configuration(attributes)
      #   !!customizations.any? { |customization| customization.configuration_id == attributes.with_indifferent_access[:configuration_id].to_i && customization.configuration_type == attributes.with_indifferent_access[:configuration_type].to_s }
      # end
    end
  end
end

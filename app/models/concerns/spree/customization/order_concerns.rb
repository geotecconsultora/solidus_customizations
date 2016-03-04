module Spree
  module Customization::OrderConcerns
    extend ActiveSupport::Concern

    included do
      money_methods :customization_total

      prepend(InstanceMethods)
    end

    module InstanceMethods
      def customizations_match(line_item, options = {})
        options = options.with_indifferent_access

        if options[:customizations_attributes].nil?
          return !line_item.customizations.any?
        end

        line_item.customizations.any? && line_item.customizations.all? do |customization|
          options[:customizations_attributes].values.include?(
              {
                  "source_id" => customization.source_id.to_s,
                  "source_type" => customization.source_type.to_s,
                  "configuration_id" => customization.configuration_id.to_s,
                  "configuration_type" => customization.configuration_type.to_s
              }
          )
        end
      end
    end
  end
end

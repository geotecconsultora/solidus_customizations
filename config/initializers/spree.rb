Rails.application.config.to_prepare do
  Spree::Api::ApiHelpers.order_attributes << :customization_total

  Spree::Api::LineItemsController.line_item_options = {
      customizations_attributes:
          [
              :source_id,
              :source_type,
              :configuration_id,
              :configuration_type,
              :option_id,
              :option_type
          ]
  }

  Spree::PermittedAttributes.line_item_attributes << {
      customizations_attributes: [
          :configuration_id,
          :source_id,
          :source_type,
          :configuration_type,
          :option_id,
          :option_type
      ]
  }
end
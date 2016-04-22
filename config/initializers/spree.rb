Rails.application.config.to_prepare do
  Spree::Api::ApiHelpers.order_attributes << :customization_total

  Spree::PermittedAttributes.line_item_attributes << {
      options:
          {
              customizations_attributes: [
                  :configuration_id,
                  :source_id,
                  :source_type,
                  :configuration_type,
                  :option_id,
                  :option_type
              ]
          }
  }
end
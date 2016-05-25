Spree::PermittedAttributes.module_eval do

  class_variable_set(:@@line_item_option_attributes,
                     class_variable_get(:@@line_item_option_attributes).push(
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
                     ))
end

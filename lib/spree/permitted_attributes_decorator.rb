Spree::PermittedAttributes.module_eval do
  mattr_accessor :item_customization_attributes

  class_variable_set(:@@item_customization_attributes, [
    :configuration_id,
    :configuration_type,
    :source_id,
    :source_type,
    :article_id,
    :article_type,
    :is_non_standard
  ])
end

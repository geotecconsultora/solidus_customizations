Spree::PermittedAttributes.module_eval do
  mattr_accessor :item_customization_attributes

  class_variable_set(:@@item_customization_attributes, [
    :user_id, :medium, :name, :size, :markup, :render_url, :source_id, :template_id
  ])
end

Spree::Api::Config.module_eval do
  class_variable_set(
      :@@order_attributes,
      class_variable_get(:@@order_attributes).push(:customization_total))

end
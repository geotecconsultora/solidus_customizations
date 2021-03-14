module SolidusCustomizations
  module PermittedAttributes
    class << self
      def update_spree_permitted_attributes
        Spree::PermittedAttributes.line_item_attributes << { options: [{
                                                                      customizations_attributes: [
                                                                          :configuration_id,
                                                                          :configuration_type,
                                                                          :source_id,
                                                                          :source_type,
                                                                          :article_id,
                                                                          :article_type
                                                                      ]
                                                                  }] }
      end
    end
  end
end
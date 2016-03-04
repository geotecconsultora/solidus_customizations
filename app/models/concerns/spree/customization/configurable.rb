module Spree
  module Customization::Configurable
    extend ActiveSupport::Concern

    included do
      belongs_to :product

      validates :name, presence: true

      include Spree::AdjustmentSource

      before_destroy :deals_with_adjustments_for_deleted_source

      has_many :adjustments, as: :source

      prepend(InstanceMethods)
    end

    module InstanceMethods
      def virtual_proofable?
        virtual_proofable
      end
    end

  end
end
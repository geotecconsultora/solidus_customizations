module Spree
  module Customization::Option
    extend ActiveSupport::Concern

    included do
      acts_as_paranoid

      include Spree::CalculatedAdjustments
      include Spree::AdjustmentSource

      before_destroy :deals_with_adjustments_for_deleted_source

      has_many :adjustments, as: :source
    end
  end
end
module Spree
  # Adjust a single customizable item (line item or shipment)
  class Customizations::ItemAdjuster
    attr_reader :item

    # @param [Spree::LineItem,Spree::Shipment] item to adjust
    def initialize(item)
      @item = item
    end

    # Deletes all existing customization adjustments and creates new adjustments
    # for all applicable customization fees.
    #
    # Creating the adjustments will also run the ItemAdjustments class and
    # persist all totals on the item.
    #
    # @return [Array<Spree::Adjustment>] newly created adjustments
    def adjust!
      return unless item.customizations.any?

      # Using .destroy_all to make sure callbacks fire
      item.adjustments.customization.destroy_all

      item.customizations.where.not(source_id: nil).map do |customization|
        customization.source.adjust(item)
      end
    end
  end
end
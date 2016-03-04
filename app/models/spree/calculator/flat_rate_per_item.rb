require_dependency 'spree/shipping_calculator'

module Spree
  class Calculator::FlatRatePerItem < Calculator
    preference :amount, :decimal, default: 0
    preference :currency, :string, default: -> { Spree::Config[:currency] }

    def self.description
      Spree.t(:flat_rate_per_item)
    end

    def compute(object=nil)
      object.quantity * preferred_amount
    end
  end
end
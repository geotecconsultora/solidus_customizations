module SolidusCustomizations
  module PermissionSets
    class DefaultCustomer < Spree::PermissionSets::Base
      def activate!
        # can :create, Customization
        # can [:read, :update], Customization do |customization, token|
        #   order = customization.line_item.order
        #   order.user == user || order.guest_token && token == order.guest_token
        # end
      end
    end
  end
end
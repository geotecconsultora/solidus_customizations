module Spree
  module Customization::Source
    extend ActiveSupport::Concern

    included do
      has_many :customizations, as: :source
    end

  end
end
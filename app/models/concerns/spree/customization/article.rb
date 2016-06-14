module Spree
  module Customization::Article
    extend ActiveSupport::Concern

    included do
      has_many :customizations, as: :article
    end

  end
end
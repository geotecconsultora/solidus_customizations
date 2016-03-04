require 'spec_helper'

module Spree

  describe Spree::ProductDuplicator, :type => :model do

    let(:product) { create(:product, properties: [create(:property, name: "MyProperty")])}
    let!(:duplicator) { Spree::ProductDuplicator.new(product)}

    it "will duplicate the product" do
      expect{duplicator.duplicate}.to change{Spree::Product.count}.by(1)
    end

    context "product attributes" do
      let!(:new_product) {duplicator.duplicate}

      it "will set an unique name" do
        expect(new_product.name).to eql "COPY OF #{product.name}"
      end

      it "will set an unique sku" do
        expect(new_product.sku).to include "COPY OF SKU"
      end

      it "copied the properties" do
        expect(new_product.product_properties.count).to be 1
        expect(new_product.product_properties.first.property.name).to eql "MyProperty"
      end

      it "duplicates the customization configuration" do
        expect(new_product.customization_configuration).to be_truthy
        expect(new_product.customization_configuration.type).to eql product.customization_configuration.type
      end
    end
  end
end
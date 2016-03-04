require 'spree/testing_support/factories/calculator_factory'

FactoryGirl.define do
  factory :customization_option, class: Spree::CustomizationOption do
    name 'Standard engraving'
    label 'Engraving'
    calculator :calculator
  end
end
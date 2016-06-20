FactoryGirl.define do
  factory :customization, class: Spree::Customization do
    line_item
  end
end
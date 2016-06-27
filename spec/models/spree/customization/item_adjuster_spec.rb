require 'spec_helper'

RSpec.describe Spree::Customizations::ItemAdjuster do
  subject(:adjuster) { described_class.new(item) }
  let(:order) { Spree::Order.new }
  let(:item) { Spree::LineItem.new(order: order) }

  describe 'initialization' do
    it 'sets adjustable' do
      expect(adjuster.item).to eq(item)
    end
  end

  describe '#adjust!' do

    context 'when the item has no customizations' do
      it 'returns nil early' do
        expect(adjuster.adjust!).to be_nil
      end
    end
  end
end
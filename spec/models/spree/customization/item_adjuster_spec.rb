require 'spec_helper'

RSpec.describe Spree::Customization::ItemAdjuster do
  subject(:adjuster) { described_class.new(item) }
  let(:order) { Spree::Order.new }
  let(:item) { Spree::LineItem.new(order: order) }

  describe 'initialization' do
    it 'sets order to item order' do
      expect(adjuster.order).to eq(item.order)
    end

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

    context 'when the item has customizations' do

      context 'when there are no customization sources that require adjusting' do
        it 'returns no adjustments' do
          expect(adjuster.adjust!).to eq([])
        end
      end

      context 'when there are customization sources that require adjusting' do

        context 'and all rates have the same tax category as the item' do
          let(:customization_source_1) { create :customization_source }
          let(:customization_source_2) { create :customization_source }

          before { allow(item).to receive(:tax_category).and_return(item_tax_category) }

          it 'creates an adjustment for customization source' do
            expect(rate_1).to receive_message_chain(:adjustments, :create!)
            expect(adjuster.adjust!.length).to eq(1)
          end
        end
      end
    end
  end
end
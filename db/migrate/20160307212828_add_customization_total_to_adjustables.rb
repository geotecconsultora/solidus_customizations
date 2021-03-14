class AddCustomizationTotalToAdjustables < SolidusSupport::Migration[4.2]
  def change
    add_column :spree_line_items, :customization_total, :decimal, precision: 10, scale: 2, default: 0.0
    add_column :spree_shipments, :customization_total, :decimal, precision: 10, scale: 2, default: 0.0
    add_column :spree_orders, :customization_total, :decimal, precision: 10, scale: 2, default: 0.0
  end
end

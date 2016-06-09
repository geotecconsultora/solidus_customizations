Spree::RoleConfiguration.configure do |config|
  config.assign_permissions :default, [Spree::Customizations::PermissionSets::DefaultCustomer]
end
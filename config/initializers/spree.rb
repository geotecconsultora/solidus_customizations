Spree::RoleConfiguration.configure do |config|
  config.assign_permissions :default, [SolidusCustomizations::PermissionSets::DefaultCustomer]
end
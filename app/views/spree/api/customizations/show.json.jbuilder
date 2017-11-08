json.(@customization)
json.cache! [customization] do
  json.partial!("spree/api/customizations/customization", customization: customization)
end

json.cache! [customization] do
  json.extract! customization, :id, :source_id, :source_type, :configuration_id, :configuration_type
  
  json.virtual_proof, if: lambda { |customization| customization.virtual_proofable? } do |customization|
    json.small customization.virtual_proof.url(:small, escape: false)
    json.medium customziation.virtual_proof.url(:small, escape: false)
    json.large customization.virtual_proof.url(:small, escape: false)
  end
  
  json.article do
    json.extract! article, :id, :size, :medium
    json.rendering article.source do |json, source|
      json.small source.rendering.url(:small)
      json.medium source.rendering.url(:medium)
      json.large source.rendering.url(:large)
    end
  end
end
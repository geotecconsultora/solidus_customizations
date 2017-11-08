json.cache! [customization] do
  json.(customization, :id, :source_id, :source_type, :configuration_id, :configuration_type)
  
  json.virtual_proof(if: lambda { |customization| customization.virtual_proofable? }) do |customization|
    json.small customization.virtual_proof.url(:small, escape: false)
    json.medium customization.virtual_proof.url(:medium, escape: false)
    json.large customization.virtual_proof.url(:large, escape: false)
    json.original customization.virtual_proof.url(:original, escape: false)
  end
  
  json.(article, :id, :size, :medium) do
    json.rendering(source) do
      json.small source.rendering.url(:small)
      json.medium source.rendering.url(:medium)
      json.large source.rendering.url(:large)
      json.original source.rendering.url(:original)
    end
  end
end

json.cache! [customization] do
  json.(customization, :id, :source_id, :source_type, :configuration_id, :configuration_type)
  
  # json.virtual_proof(if: lambda { |customization| customization.virtual_proofable? }) do
  json.virtual_proof do
    if lambda { |customization| customization.virtual_proofable? }
      json.small(customization.virtual_proof.url(:small, escape: false))
      json.medium(customization.virtual_proof.url(:medium, escape: false))
      json.large(customization.virtual_proof.url(:large, escape: false))
      json.original(customization.virtual_proof.url(:original, escape: false))
    end
  end

  json.configuration(customization.configuration, :id, :name, :type)

  json.design do
    json.(customization.article, :id, :size, :medium)
    json.rendering do
      json.small customization.article.source.rendering.url(:small)
      json.medium customization.article.source.rendering.url(:medium)
      json.large customization.article.source.rendering.url(:large)
      json.original customization.article.source.rendering.url(:original)
    end
  end
end

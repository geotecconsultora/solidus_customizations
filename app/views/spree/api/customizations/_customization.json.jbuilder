json.cache! [customization] do
  json.(customization, :id, :source_id, :source_type, :configuration_id, :configuration_type, :is_non_standard)

  json.virtual_proof do
    if customization.virtual_proofable?
      json.small(customization.virtual_proof.url(:small, escape: false))
      json.medium(customization.virtual_proof.url(:medium, escape: false))
      json.large(customization.virtual_proof.url(:large, escape: false))
      json.original(customization.virtual_proof.url(:original, escape: false))
    else
      json.nil!
    end
  end

  json.configuration(customization.configuration, :id, :name, :type)

  json.design do
    json.(customization.article, :id, :size, :medium)
    json.rendering do
      json.small customization.article.rendering.url(:small)
      json.medium customization.article.rendering.url(:medium)
      json.large customization.article.rendering.url(:large)
      json.original customization.article.rendering.url(:original)
    end
  end
end

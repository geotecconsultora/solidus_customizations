cache [root_object]
attributes :id, :source_id, :source_type, :configuration_id, :configuration_type, :is_non_standard

node :virtual_proof, if: lambda { |customization| customization.virtual_proofable? } do |customization|
    {
         small: customization.virtual_proof.url(:small, escape: false),
         medium: customization.virtual_proof.url(:medium, escape: false),
         large: customization.virtual_proof.url(:large, escape: false)
    }
end

child :article do
    attributes :id, :size, :medium

    node :rendering do |source|
       {
         small: source.rendering.url(:small),
         medium: source.rendering.url(:medium),
         large: source.rendering.url(:large)
       }
    end
end

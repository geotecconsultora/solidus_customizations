cache [root_object]
attributes :id, :source_id, :source_type, :configuration_id, :configuration_type

node :virtual_proof, if: lambda { |customization| customization.virtual_proofable? } do |customization|
    {
         small: customization.virtual_proof.url(:small, escape: false),
         medium: customization.virtual_proof.url(:medium, escape: false),
         large: customization.virtual_proof.url(:large, escape: false)
    }
end

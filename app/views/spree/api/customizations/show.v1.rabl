object @customization
cache [root_object]

attributes :id, :source_id, :source_type, :configuration_id, :configuration_type

node :virtual_proof, if: lambda { |customization| customization.virtual_proofable? } do |customization|
    {
         small: customization.virtual_proof.url(:small, escape: false),
         medium: customization.virtual_proof.url(:medium, escape: false),
         large: customization.virtual_proof.url(:large, escape: false)
    }
end

child :source do
 attributes :id, :size, :medium

 node :images do |design|
   {
     small: design.rendering.url(:small),
     medium: design.rendering.url(:medium),
     large: design.rendering.url(:large)
   }
 end
end
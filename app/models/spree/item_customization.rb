module Spree
  # Customizations represent additional information
  # that can be added to items (line items or shipments)
  # in order to make them unique or change their total.
  class ItemCustomization < Spree::Base
    belongs_to :customizable, polymorphic: true, touch: true
    belongs_to :configuration, polymorphic: true
    belongs_to :source, -> { with_deleted }, polymorphic: true
    belongs_to :article, -> { with_deleted }, polymorphic: true

    has_attached_file :virtual_proof, styles: { medium: "600x600>", small: "300x300>" }, default_url: :virtual_proof_url

    validates_attachment_content_type :virtual_proof, content_type: /\Aimage\/.*\Z/

    validates :article, presence: true

    before_save :set_virtual_proof, if: :virtual_proofable?

    after_create :adjust_item

    after_commit :attach_virtual_proof, if: :virtual_proofable?

    def virtual_proofable?
      configuration.try(:virtual_proofable?) == nil || configuration.try(:virtual_proofable?)
    end

    def force_set_virtual_proof(url = nil)
      if url
        self.virtual_proof_url = url.html_safe
      else
        self.virtual_proof_url = Spree::Designs::VirtualProof::LiquidPixels.new(customizable, article).url.html_safe
      end
      self.virtual_proof.clear
      self.virtual_proof_changed = true
    end

    private

    def set_virtual_proof
      return unless article_id_changed? || (article && article.changed?)

      # Hardcoded rendering class, let this be configurable resource in the future
      self.virtual_proof_url = Spree::Designs::VirtualProof::LiquidPixels.new(customizable, article).url.html_safe
      self.virtual_proof.clear
      self.virtual_proof_changed = true
    end

    def attach_virtual_proof
      return unless self.virtual_proof_changed

      self.update_column('virtual_proof_changed', false)
      AttachVirtualProofJob.perform_later self
    end

    def adjust_item
      Spree::Customizations::ItemAdjuster.new(self.customizable).adjust!
    end
  end
end
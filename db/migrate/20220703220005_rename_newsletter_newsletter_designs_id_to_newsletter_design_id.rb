class RenameNewsletterNewsletterDesignsIdToNewsletterDesignId < ActiveRecord::Migration[7.0]
  def change
    rename_column(:newsletter_newsletters, :newsletter_designs_id, :newsletter_design_id)
  end
end

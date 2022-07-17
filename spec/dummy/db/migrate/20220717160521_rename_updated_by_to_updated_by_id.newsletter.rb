# This migration comes from newsletter (originally 20220629204825)
class RenameUpdatedByToUpdatedById < ActiveRecord::Migration[7.0]
  def change
    rename_column(:newsletter_designs, :updated_by, :updated_by_id)
  end
end

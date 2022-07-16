class RenameUpdatedByToUpdatedById < ActiveRecord::Migration[7.0]
  def change
    rename_column(:newsletter_designs, :updated_by, :updated_by_id)
  end
end

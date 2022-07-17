# This migration comes from newsletter (originally 20220628214734)
class RenameStysheetTextInDesign < ActiveRecord::Migration[7.0]
  def change
    rename_column(:newsletter_designs, :stysheet_text, :stylesheet_text)
  end
end

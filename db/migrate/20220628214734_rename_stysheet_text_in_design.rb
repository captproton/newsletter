class RenameStysheetTextInDesign < ActiveRecord::Migration[7.0]
  def change
    rename_column(:newsletter_designs, :stysheet_text, :stylesheet_text)
  end
end

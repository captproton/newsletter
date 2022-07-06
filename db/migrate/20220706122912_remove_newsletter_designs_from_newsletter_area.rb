class RemoveNewsletterDesignsFromNewsletterArea < ActiveRecord::Migration[7.0]
  def change
    remove_reference :newsletter_areas, :newsletter_designs, null: false, foreign_key: true
  end
end

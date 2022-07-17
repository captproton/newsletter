# This migration comes from newsletter (originally 20220706132333)
class RemoveUpdatedByFromNewsletterArea < ActiveRecord::Migration[7.0]
  def change
    remove_column :newsletter_areas, :updated_by, :integer
  end
end

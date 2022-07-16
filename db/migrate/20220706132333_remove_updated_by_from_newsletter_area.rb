class RemoveUpdatedByFromNewsletterArea < ActiveRecord::Migration[7.0]
  def change
    remove_column :newsletter_areas, :updated_by, :integer
  end
end

class AddUpdatedByToNewsletterArea < ActiveRecord::Migration[7.0]
  def change
    add_reference :newsletter_areas, :updated_by, null: false, foreign_key: {to_table: :users}
  end
end

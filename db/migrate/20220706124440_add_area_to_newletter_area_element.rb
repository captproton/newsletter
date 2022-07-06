class AddAreaToNewletterAreaElement < ActiveRecord::Migration[7.0]
  def change
    add_reference :newsletter_area_elements, :area, null: false, foreign_key: {to_table: :newsletter_areas}
  end
end

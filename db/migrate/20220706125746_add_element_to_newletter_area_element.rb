class AddElementToNewletterAreaElement < ActiveRecord::Migration[7.0]
  def change
    add_reference :newsletter_area_elements, :element, null: false, foreign_key: {to_table: :newsletter_elements}
  end
end

class AddElementToNewsletterField < ActiveRecord::Migration[7.0]
  def change
    add_reference :newsletter_fields, :element, null: false, foreign_key: {to_table: :newsletter_elements}
  end
end

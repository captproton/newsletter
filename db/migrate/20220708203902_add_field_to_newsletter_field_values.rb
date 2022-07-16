class AddFieldToNewsletterFieldValues < ActiveRecord::Migration[7.0]
  def change
    add_reference :newsletter_field_values, :field, null: false, foreign_key: {to_table: :newsletter_fields}
  end
end

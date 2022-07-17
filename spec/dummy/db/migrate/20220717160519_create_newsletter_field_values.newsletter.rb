# This migration comes from newsletter (originally 20220625230110)
class CreateNewsletterFieldValues < ActiveRecord::Migration[7.0]
  def change
    create_table :newsletter_field_values do |t|
      t.references :piece, null: false, foreign_key: {to_table: :newsletter_pieces}
      t.references :field, null: false, foreign_key: {to_table: :newsletter_fields}
      t.string :key,                  null: false
      t.text :value,                  null: false
      t.integer :updated_by
      t.datetime :deleted_at

      t.timestamps
    end
  end
end

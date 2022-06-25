class CreateNewsletterFieldValues < ActiveRecord::Migration[7.0]
  def change
    create_table :newsletter_field_values do |t|
      t.references :newsletter_piece, null: false, foreign_key: true
      t.references :newsletter_field, null: false, foreign_key: true
      t.string :key,                  null: false
      t.text :value,                  null: false
      t.integer :updated_by
      t.datetime :deleted_at

      t.timestamps
    end
  end
end

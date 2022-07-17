class CreateNewsletterPieces < ActiveRecord::Migration[7.0]
  def change
    create_table :newsletter_pieces do |t|
      t.references :newsletter,  null: false, foreign_key: {to_table: :newsletter_newsletters}
      t.references :area,        null: false, foreign_key: {to_table: :newsletter_areas}
      t.references :element,     null: false, foreign_key: {to_table: :newsletter_elements}
      t.integer :sequence,       null: false
      t.integer :updated_by
      t.datetime :deleted_at

      t.timestamps
    end
  end
end

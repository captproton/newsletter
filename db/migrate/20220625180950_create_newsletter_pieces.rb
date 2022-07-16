class CreateNewsletterPieces < ActiveRecord::Migration[7.0]
  def change
    create_table :newsletter_pieces do |t|
      t.references :newsletter_newsletter,  null: false, foreign_key: true
      t.references :newsletter_area,        null: false, foreign_key: true
      t.references :newsletter_element,     null: false, foreign_key: true
      t.integer :sequence,                  null: false
      t.integer :updated_by
      t.datetime :deleted_at

      t.timestamps
    end
  end
end

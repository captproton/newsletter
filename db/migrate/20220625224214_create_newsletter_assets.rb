class CreateNewsletterAssets < ActiveRecord::Migration[7.0]
  def change
    create_table :newsletter_assets do |t|
      t.references :newsletter_field, null: false, foreign_key: true
      t.references :newsletter_piece, null: false, foreign_key: true
      t.string :image
      t.string :content_type
      t.integer :size
      t.integer :width
      t.integer :parent_id
      t.string :thumbnail
      t.integer :updated_by
      t.datetime :deleted_at

      t.timestamps
    end
  end
end

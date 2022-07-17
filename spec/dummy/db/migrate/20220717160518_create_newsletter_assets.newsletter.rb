# This migration comes from newsletter (originally 20220625224214)
class CreateNewsletterAssets < ActiveRecord::Migration[7.0]
  def change
    create_table :newsletter_assets do |t|
      t.references :field, null: false, foreign_key: {to_table: :newsletter_fields}
      t.references :piece, null: false, foreign_key: {to_table: :newsletter_pieces}
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

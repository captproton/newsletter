class CreateNewsletterNewsletters < ActiveRecord::Migration[7.0]
  def change
    create_table :newsletter_newsletters do |t|
      t.string :name,       null: false
      t.string :description
      t.references :newsletter_designs, null: false, foreign_key: true
      t.integer :sequence
      t.datetime :published_at
      t.integer :updated_by
      t.datetime :deleted_at

      t.timestamps
    end
  end
end

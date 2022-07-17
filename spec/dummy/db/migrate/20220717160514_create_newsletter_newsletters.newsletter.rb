# This migration comes from newsletter (originally 20220625171232)
class CreateNewsletterNewsletters < ActiveRecord::Migration[7.0]
  def change
    create_table :newsletter_newsletters do |t|
      t.string      :name,        null: false
      t.string      :description
      t.integer     :sequence
      t.references  :design,      null: false, foreign_key: {to_table: :newsletter_designs}
      t.references  :updated_by,  null: false, foreign_key: {to_table: :users}

      t.datetime :published_at
      t.datetime :deleted_at

      t.timestamps
    end
  end
end

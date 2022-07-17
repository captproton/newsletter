# This migration comes from newsletter (originally 20220625021215)
class CreateNewsletterAreas < ActiveRecord::Migration[7.0]
  def change
    create_table :newsletter_areas do |t|
      t.string :name,       null: false
      t.string :description
      t.references :design, null: false, foreign_key: {to_table: :newsletter_designs}
      t.integer :updated_by
      t.datetime :delelted_at

      t.timestamps
    end
  end
end

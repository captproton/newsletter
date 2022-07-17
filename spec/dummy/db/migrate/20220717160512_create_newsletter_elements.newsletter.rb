# This migration comes from newsletter (originally 20220625015145)
class CreateNewsletterElements < ActiveRecord::Migration[7.0]
  def change
    create_table :newsletter_elements do |t|
      t.string :name, :null => false
      t.string :description
      t.text :html_design
      t.references :designs, null: false, foreign_key: {to_table: :newsletter_designs}
      t.integer :updated_by
      t.datetime :deleted_at

      t.timestamps
    end
  end
end

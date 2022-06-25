class CreateNewsletterElements < ActiveRecord::Migration[7.0]
  def change
    create_table :newsletter_elements do |t|
      t.string :name, :null => false
      t.string :description
      t.text :html_design
      t.references :newsletter_designs, null: false, foreign_key: true
      t.integer :updated_by
      t.datetime :deleted_at

      t.timestamps
    end
  end
end

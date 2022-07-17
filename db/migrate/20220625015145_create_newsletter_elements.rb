class CreateNewsletterElements < ActiveRecord::Migration[7.0]
  def change
    create_table :newsletter_elements do |t|
      t.string :name, :null => false
      t.string :description
      t.text :html_design
      t.references :design, null: false, foreign_key: {to_table: :newsletter_designs}
      t.references :updated_by, null: false, foreign_key: {to_table: :users}
      t.datetime :deleted_at

      t.timestamps
    end
  end
end

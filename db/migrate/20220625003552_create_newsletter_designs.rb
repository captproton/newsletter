class CreateNewsletterDesigns < ActiveRecord::Migration[7.0]
  def change
    create_table :newsletter_designs do |t|
      t.string :name,            :null => false
      t.string :description
      t.text :html_design
      t.text :stysheet_text
      t.references  :updated_by,  null: false, foreign_key: {to_table: :users}

      t.timestamps
    end
  end
end

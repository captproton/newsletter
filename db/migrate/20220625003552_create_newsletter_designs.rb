class CreateNewsletterDesigns < ActiveRecord::Migration[7.0]
  def change
    create_table :newsletter_designs do |t|
      t.string :name,            :null => false
      t.string :description
      t.text :html_design
      t.integer :updated_by
      t.text :stysheet_text

      t.timestamps
    end
  end
end

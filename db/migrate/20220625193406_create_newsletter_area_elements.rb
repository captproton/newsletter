class CreateNewsletterAreaElements < ActiveRecord::Migration[7.0]
  def change
    create_table :newsletter_area_elements do |t|
      t.references :newsletter_area, null: false, foreign_key: true
      t.references :newsletter_element, null: false, foreign_key: true

      t.timestamps
    end
  end
end

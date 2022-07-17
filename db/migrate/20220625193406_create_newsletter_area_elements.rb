class CreateNewsletterAreaElements < ActiveRecord::Migration[7.0]
  def change
    create_table :newsletter_area_elements do |t|
      t.references :area, null: false, foreign_key: {to_table: :newsletter_areas}
      t.references :element, null: false, foreign_key: true, foreign_key: {to_table: :newsletter_elements}

      t.timestamps
    end
  end
end

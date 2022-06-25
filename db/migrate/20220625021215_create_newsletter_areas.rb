class CreateNewsletterAreas < ActiveRecord::Migration[7.0]
  def change
    create_table :newsletter_areas do |t|
      t.string :name,       null: false
      t.string :description
      t.references :newsletter_designs, null: false, foreign_key: true
      t.integer :updated_by
      t.datetime :delelted_at

      t.timestamps
    end
  end
end

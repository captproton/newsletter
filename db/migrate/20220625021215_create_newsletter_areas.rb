class CreateNewsletterAreas < ActiveRecord::Migration[7.0]
  def change
    create_table :newsletter_areas do |t|
      t.string :name,       null: false
      t.string :description
      t.references :design, null: false, foreign_key: {to_table: :newsletter_designs}
      t.references :updated_by, null: false, foreign_key: {to_table: :users}
      t.datetime :delelted_at

      t.timestamps
    end
  end
end

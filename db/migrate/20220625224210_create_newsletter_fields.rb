class CreateNewsletterFields < ActiveRecord::Migration[7.0]
  def change
    create_table :newsletter_fields do |t|
      t.string :name
      t.references :element, null: false, foreign_key: {to_table: :newsletter_elements}
      t.string :label
      t.integer :sequence
      t.boolean :is_required
      t.string :description
      t.string :type
      t.integer :updated_by, null: false, foreign_key: {to_table: :users}
      t.datetime :deleted_at

      t.timestamps
    end
  end
end

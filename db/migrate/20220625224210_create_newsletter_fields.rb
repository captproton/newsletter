class CreateNewsletterFields < ActiveRecord::Migration[7.0]
  def change
    create_table :newsletter_fields do |t|
      t.string :name
      t.references :newsletter_element, null: false, foreign_key: true
      t.string :label
      t.integer :sequence
      t.boolean :is_required
      t.string :description
      t.string :type
      t.integer :updated_by
      t.datetime :deleted_at

      t.timestamps
    end
  end
end

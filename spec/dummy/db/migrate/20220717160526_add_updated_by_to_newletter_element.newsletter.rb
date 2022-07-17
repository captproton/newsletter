# This migration comes from newsletter (originally 20220705183727)
class AddUpdatedByToNewletterElement < ActiveRecord::Migration[7.0]
  def change
    add_reference :newsletter_elements, :updated_by, null: false, foreign_key: {to_table: :users}
  end
end
  
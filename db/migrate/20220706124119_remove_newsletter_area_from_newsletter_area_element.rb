class RemoveNewsletterAreaFromNewsletterAreaElement < ActiveRecord::Migration[7.0]
  def change
    remove_reference :newsletter_area_elements, :newsletter_area, null: false, foreign_key: true
  end
end

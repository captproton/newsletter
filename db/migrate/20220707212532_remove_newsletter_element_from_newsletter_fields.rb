class RemoveNewsletterElementFromNewsletterFields < ActiveRecord::Migration[7.0]
  def change
    remove_reference :newsletter_fields, :newsletter_element, null: false, foreign_key: true
  end
end

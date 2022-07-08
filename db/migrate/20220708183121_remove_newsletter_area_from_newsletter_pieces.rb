class RemoveNewsletterAreaFromNewsletterPieces < ActiveRecord::Migration[7.0]
  def change
    remove_reference :newsletter_pieces, :newsletter_area, null: false, foreign_key: true
  end
end

class RemoveNewsletterPieceFromNewsletterFieldValues < ActiveRecord::Migration[7.0]
  def change
    remove_reference :newsletter_field_values, :newsletter_piece, null: false, foreign_key: true
  end
end

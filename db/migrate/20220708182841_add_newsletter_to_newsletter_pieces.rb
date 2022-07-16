class AddNewsletterToNewsletterPieces < ActiveRecord::Migration[7.0]
  def change
    add_reference :newsletter_pieces, :newsletter, null: false, foreign_key: {to_table: :newsletter_newsletters}
  end
end

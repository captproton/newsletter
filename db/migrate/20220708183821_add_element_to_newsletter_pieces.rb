class AddElementToNewsletterPieces < ActiveRecord::Migration[7.0]
  def change
    add_reference :newsletter_pieces, :element, null: false, foreign_key: {to_table: :newsletter_elements}
  end
end

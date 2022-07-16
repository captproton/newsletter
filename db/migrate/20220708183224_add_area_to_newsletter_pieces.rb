class AddAreaToNewsletterPieces < ActiveRecord::Migration[7.0]
  def change
    add_reference :newsletter_pieces, :area, null: false, foreign_key: {to_table: :newsletter_areas}
  end
end

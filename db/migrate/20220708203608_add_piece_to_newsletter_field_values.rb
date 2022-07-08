class AddPieceToNewsletterFieldValues < ActiveRecord::Migration[7.0]
  def change
    add_reference :newsletter_field_values, :piece, null: false, foreign_key: {to_table: :newsletter_pieces}
  end
end

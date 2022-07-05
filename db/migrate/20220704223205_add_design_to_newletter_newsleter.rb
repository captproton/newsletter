class AddDesignToNewletterNewsleter < ActiveRecord::Migration[7.0]
  def change
    add_reference :newsletter_newsletters, :design, null: false, foreign_key: {to_table: :newsletter_designs}
  end
end

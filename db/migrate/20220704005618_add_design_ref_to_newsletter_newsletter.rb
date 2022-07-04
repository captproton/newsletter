class AddDesignRefToNewsletterNewsletter < ActiveRecord::Migration[7.0]
  def change
    add_reference :newsletter_newsletters, :design, null: false, foreign_key: true
  end
end

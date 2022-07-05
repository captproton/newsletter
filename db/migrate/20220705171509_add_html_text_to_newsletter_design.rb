class AddHtmlTextToNewsletterDesign < ActiveRecord::Migration[7.0]
  def change
    add_column :newsletter_designs, :html_text, :text
  end
end

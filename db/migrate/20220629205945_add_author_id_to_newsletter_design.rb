class AddAuthorIdToNewsletterDesign < ActiveRecord::Migration[7.0]
  def change
    add_column :newsletter_designs, :author_id, :integer
  end
end

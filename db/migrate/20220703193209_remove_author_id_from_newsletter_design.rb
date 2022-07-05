class RemoveAuthorIdFromNewsletterDesign < ActiveRecord::Migration[7.0]
  def change
    remove_column :newsletter_designs, :author_id, :integer
  end
end

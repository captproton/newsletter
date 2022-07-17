# This migration comes from newsletter (originally 20220703193209)
class RemoveAuthorIdFromNewsletterDesign < ActiveRecord::Migration[7.0]
  def change
    remove_column :newsletter_designs, :author_id, :integer
  end
end

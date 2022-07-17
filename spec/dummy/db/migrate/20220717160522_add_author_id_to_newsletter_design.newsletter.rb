# This migration comes from newsletter (originally 20220629205945)
class AddAuthorIdToNewsletterDesign < ActiveRecord::Migration[7.0]
  def change
    add_column :newsletter_designs, :author_id, :integer
  end
end

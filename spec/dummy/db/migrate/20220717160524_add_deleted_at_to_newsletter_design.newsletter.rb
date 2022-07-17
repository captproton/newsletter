# This migration comes from newsletter (originally 20220703194158)
class AddDeletedAtToNewsletterDesign < ActiveRecord::Migration[7.0]
  def change
    add_column :newsletter_designs, :deleted_at, :datetime
  end
end

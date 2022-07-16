class RemoveUpdatedByFromNewsletterField < ActiveRecord::Migration[7.0]
  def change
    remove_column :newsletter_fields, :updated_by, :integer
  end
end

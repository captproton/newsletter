class DropUsers < ActiveRecord::Migration[7.0]
  def change
    # tearing down current User model to replace with Devise version
    drop_table :users    
  end
end

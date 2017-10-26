class AddUserIdtoJob < ActiveRecord::Migration[5.1]
  def change
    add_column :jobs, :user_id, :bigint 
  end
end

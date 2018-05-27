class AddUserIdToMoviedataa < ActiveRecord::Migration[5.0]
  def change
    add_column :moviedataas, :user_id, :integer
  end
end

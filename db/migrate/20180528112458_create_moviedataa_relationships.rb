class CreateMoviedataaRelationships < ActiveRecord::Migration[5.0]
  def change
    create_table :moviedataa_relationships do |t|
      t.integer :moviedataa_id
      t.integer :user_id

      t.timestamps
    end
  end
end

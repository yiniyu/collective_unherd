class CreateCommittees < ActiveRecord::Migration[5.1]
  def change
    create_table :committees do |t|
      t.string :name
      t.integer :board_members_id
      t.integer :user_id

      t.timestamps
    end
  end
end

class CreateBoardMembers < ActiveRecord::Migration[5.1]
  def change
    create_table :board_members do |t|
      t.text :name
      t.integer :committee_id
      t.integer :user_id

      t.timestamps
    end
  end
end

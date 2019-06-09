class AddBoardMemberCountToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :board_members_count, :integer
  end
end

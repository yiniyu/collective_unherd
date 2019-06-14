class AddResponseCountToBoardMembers < ActiveRecord::Migration[5.1]
  def change
    add_column :board_members, :responses_count, :integer
  end
end

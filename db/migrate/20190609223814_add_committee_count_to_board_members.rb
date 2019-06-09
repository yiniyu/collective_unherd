class AddCommitteeCountToBoardMembers < ActiveRecord::Migration[5.1]
  def change
    add_column :board_members, :committees_count, :integer
  end
end

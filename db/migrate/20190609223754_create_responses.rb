class CreateResponses < ActiveRecord::Migration[5.1]
  def change
    create_table :responses do |t|
      t.integer :user_id
      t.integer :my_questions_id
      t.text :response
      t.integer :board_members_id

      t.timestamps
    end
  end
end

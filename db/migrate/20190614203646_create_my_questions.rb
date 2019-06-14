class CreateMyQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :my_questions do |t|
      t.integer :committee_id
      t.text :question_details
      t.text :notes
      t.integer :user_id

      t.timestamps
    end
  end
end

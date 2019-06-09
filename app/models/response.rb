class Response < ApplicationRecord
  # Direct associations

  belongs_to :question,
             :class_name => "MyQuestion",
             :foreign_key => "user_id"

  belongs_to :board_members,
             :class_name => "BoardMember",
             :counter_cache => true

  # Indirect associations

  # Validations

end

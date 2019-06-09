class Response < ApplicationRecord
  # Direct associations

  belongs_to :board_members,
             :class_name => "BoardMember",
             :counter_cache => true

  # Indirect associations

  # Validations

end

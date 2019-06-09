class BoardMember < ApplicationRecord
  # Direct associations

  has_many   :responses,
             :foreign_key => "board_members_id",
             :dependent => :nullify

  # Indirect associations

  # Validations

end

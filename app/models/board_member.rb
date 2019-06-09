class BoardMember < ApplicationRecord
  # Direct associations

  belongs_to :user,
             :counter_cache => true

  has_many   :committees,
             :foreign_key => "board_members_id",
             :dependent => :nullify

  has_many   :responses,
             :foreign_key => "board_members_id",
             :dependent => :nullify

  # Indirect associations

  # Validations

end

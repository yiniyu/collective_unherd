class BoardMember < ApplicationRecord
  # Direct associations

  belongs_to :user,
             :counter_cache => true

  has_many   :responses,
             :foreign_key => "board_members_id",
             :dependent => :nullify

  # Indirect associations

  has_one    :committee,
             :through => :user,
             :source => :committees

  # Validations

end

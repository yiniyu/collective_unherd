class Committee < ApplicationRecord
  # Direct associations

  belongs_to :user,
             :counter_cache => true

  # Indirect associations

  has_one    :board_member,
             :through => :user,
             :source => :board_members

  # Validations

end

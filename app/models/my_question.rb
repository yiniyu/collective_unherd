class MyQuestion < ApplicationRecord
  # Direct associations

  belongs_to :user

  has_many   :responses,
             :foreign_key => "user_id",
             :dependent => :destroy

  # Indirect associations

  # Validations

end

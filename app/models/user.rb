class User < ApplicationRecord
  # Direct associations

  has_many   :committees,
             :dependent => :nullify

  has_many   :board_members,
             :dependent => :nullify

  has_many   :my_questions,
             :dependent => :destroy

  # Indirect associations

  # Validations

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end

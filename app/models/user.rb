class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :username,uniqueness: true,presence: true,
            length:{in:2..20}
 devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :trackable, :validatable

   has_many :books,dependent: :destroy

   attachment :profile_image



 def email_required?
   false
 end
 def email_changed?
   false
 end
end
class User < ApplicationRecord
    has_many :user_meds
    has_many :meds, through: :user_meds
    belongs_to :doctor
    has_secure_password

    validates :email, presence: true
    validates :email, uniqueness: true
end

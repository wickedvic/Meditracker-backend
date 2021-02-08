class UserMed < ApplicationRecord
    belongs_to :med
    belongs_to :user
end

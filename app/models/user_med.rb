class UserMed < ApplicationRecord
    belongs_to :med, optional: true
    belongs_to :user, optional: true
end

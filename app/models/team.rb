class Team < ApplicationRecord
    has_many :users
    has_many :standups
    belongs_to :company
    
end

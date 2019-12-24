class User < ApplicationRecord
    belongs_to :company
    belongs_to :team
    has_many :standups
end

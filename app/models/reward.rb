class Reward < ApplicationRecord
    has_one :ticket
    belongs_to :winner, optional: true
    validates :title, presence: true
end

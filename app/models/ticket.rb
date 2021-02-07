class Ticket < ApplicationRecord
    belongs_to :reward, optional: true
    belongs_to :user, optional: true
    validates :ticket_number, presence: true
    validates :used, presence: true
end
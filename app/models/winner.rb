class Winner < ApplicationRecord
    has_one :user
    has_one :reward
end

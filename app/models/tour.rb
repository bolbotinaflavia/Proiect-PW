class Tour < ApplicationRecord
    belongs_to :eveniment
    has_many :rezervares
end

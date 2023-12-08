class Rezervare < ApplicationRecord
    belongs_to :tour, foreign_key: 'tours_id'
  belongs_to :user
  validates :tour, presence: true
  validates :user, presence: true
end

class GameComment < ApplicationRecord
  validates :comment, presence: true
  belongs_to :game
  belongs_to :user
end

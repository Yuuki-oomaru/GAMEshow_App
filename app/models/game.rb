class Game < ApplicationRecord
  belongs_to :user
  attachment :game_image
  has_many :favorites, dependent: :destroy
  has_many :game_comments, dependent: :destroy
  acts_as_taggable_on :tags

  validates :title, presence: true
	validates :body, presence: true, length: {maximum: 200}

   def favorited_by?(user)
		favorites.where(user_id: user.id).exists?
	end
end

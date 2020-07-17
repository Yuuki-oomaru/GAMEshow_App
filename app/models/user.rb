class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :games, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :game_comments, dependent: :destroy

  has_many :entries
  has_many :messages
  has_many :rooms, through: :user_rooms

  attachment :profile_image
  validates :name, presence: true, length: {maximum: 20, minimum: 2}
  validates:introduction, length:{maximum:50}
end

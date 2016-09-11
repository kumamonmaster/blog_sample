class User < ApplicationRecord
  has_many :posts
  has_many :favorites
  has_many :relationships, foreign_key: :follower_id
  has_many :followings, through: :relationships

  has_many :inverse_follows, foreign_key: :following_id, class_name: Relationship
  has_many :followers, through: :inverse_follows
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def followed_by? user
    inverse_follows.where(follower_id: user.id).exists?
  end
end

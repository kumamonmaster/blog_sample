class Post < ApplicationRecord
  belongs_to :user
  has_many :favorites, dependet: :destroy
  mount_uploader :image, ImageUploader
  acts_as_ordered_taggable_on :interests

  def favorited_by? user
    favorites.where(user_id: user_id).exists?
  end
end

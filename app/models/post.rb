class Post < ApplicationRecord
	validates :user_id, presence: true
	validates :image, presence: true
	mount_uploader :image, ImageUploader
	belongs_to :user
	has_many :comments, dependent: :destroy
end

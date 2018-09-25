class Post < ApplicationRecord
	validates :user_id, presence: true
	validates :image, presence: true
	mount_uploader :image, ImageUploader
	belongs_to :user
	has_many :comments, dependent: :destroy
	#include PgSearch
  #pg_search_scope :search_by_caption, against: [:caption], using: {
      #tsearch: {
        #prefix: true
      #}
    #}
end

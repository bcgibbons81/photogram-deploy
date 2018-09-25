class User < ApplicationRecord
  has_secure_password
  validates :email, uniqueness: true, presence: true
  validates :user_name, presence: true, length: { minimum: 2, maximum: 16 }
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  mount_uploader :avatar, AvatarUploader
  include PgSearch
  pg_search_scope :search, against: [:user_name], using: {
      tsearch: {
        prefix: true
      }
    }

  enum role: [:user, :admin, :god]
     
end

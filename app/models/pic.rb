class Pic < ActiveRecord::Base
  mount_uploader :picture, ImageUploader
  validates :title, presence: true
  validates :content, presence: true
  belongs_to :user
end

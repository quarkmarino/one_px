class Photo < ActiveRecord::Base
  validates :title, :description, presence: true
  mount_uploader :picture, PictureUploader
end

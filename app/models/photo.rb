class Photo < ActiveRecord::Base
  mount_uploader :image, ImageUploader
  belongs_to :city
  scope :active,  -> { where(active: true) }
  scope :standby, -> { where(active: false) }
end

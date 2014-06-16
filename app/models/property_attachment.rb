class PropertyAttachment < ActiveRecord::Base
	mount_uploader :avatar, ImageUploader
  belongs_to :property
end
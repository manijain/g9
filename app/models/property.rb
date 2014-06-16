class Property < ActiveRecord::Base
	# belongs_to :user
	has_many :property_attachments
 	accepts_nested_attributes_for :property_attachments
	
	# mount_uploader :image, ImageUploader
	# belongs_to :property
end
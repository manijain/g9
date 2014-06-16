class Property < ActiveRecord::Base
	# belongs_to :user
	has_many :property_attachments, dependent: :destroy
 	accepts_nested_attributes_for :property_attachments
	
	# mount_uploader :image, ImageUploader
	# belongs_to :property

	validates :title, :location, :approx_prize, :approx_sale_duration, presence: true
	validates :title, length: { maximum: 300 }
	validates :description, length: { maximum: 600 }
	validates :approx_prize, numericality: { only_integer: true }
	validates :approx_sale_duration, length: { maximum: 100 }
end
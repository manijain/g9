class Property < ActiveRecord::Base
  # belongs_to :user
  has_many :property_attachments, dependent: :destroy
  accepts_nested_attributes_for :property_attachments
  
  # mount_uploader :image, ImageUploader
  # belongs_to :property

  validates :title, :location, :approx_price, :approx_sale_duration, presence: true
  validates :title, length: { maximum: 300 }
  validates :description, length: { maximum: 600 }
  validates :approx_price, numericality: { only_integer: true }
  validates :approx_sale_duration, length: { maximum: 100 }

  def self.search(query, min_price, max_price)
    # where(:title, query) -> This would return an exact match of the query
    where("(title like ? OR location like ?) AND approx_price between ? AND ?", "%#{query}%", "%#{query}%", min_price, max_price) 
  end
end
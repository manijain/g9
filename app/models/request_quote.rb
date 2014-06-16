class RequestQuote < ActiveRecord::Base
	validates :name, :email, :phone, :message, presence: true
	validates :message, length: { maximum: 500 }
	validates :name, length: { maximum: 100 }
	validates :phone, numericality: { only_integer: true }
end
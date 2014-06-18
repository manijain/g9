class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  paginates_per 10

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :name, :address, :phone, :city, :occupation, :gender, presence: true
  validates :name, :city, :occupation, length: { maximum: 300 }
  validates :address, length: { maximum: 600 }
  validates :phone, numericality: { only_integer: true }

  # has_many :properties
end
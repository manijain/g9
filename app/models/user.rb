class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  paginates_per 10

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  # validates :name, :address, :phone, :city, :occupation, :gender, presence: true
  validates :name, :city, :occupation, length: { maximum: 300 }
  validates :address, length: { maximum: 600 }
  validates :phone, numericality: { only_integer: true }, :allow_blank => true 

  has_many :comments, dependent: :destroy

  after_create :send_welcome_mail

  def self.find_for_facebook_oauth(auth, signed_in_resource=nil)

    user = User.where(:provider => auth.provider, :uid => auth.uid).first
    if user
      if auth.info.image.present?
          user.update_attribute(:image, auth.info.image)
      end   
      return user
    else
      registered_user = User.where(:email => auth.info.email).first
      if registered_user
        if auth.info.image.present?
          registered_user.update_attributes(:provider => "facebook", :image => auth.info.image)
        end
        return registered_user
      else
        user = User.create(name:auth.extra.raw_info.name, provider:auth.provider,uid:auth.uid,email:auth.info.email,password:Devise.friendly_token[0,20])
        if auth.info.image.present?
          user.update_attribute(:image, auth.info.image)
        end
      end
    end
  end

  def self.find_for_google_oauth2(access_token, signed_in_resource=nil)
    data = access_token.info
    user = User.where(:provider => access_token.provider, :uid => access_token.uid ).first
    if user
      if access_token.info.image.present?
        user.update_attribute(:image, access_token.info.image)
      end
      return user
    else
      registered_user = User.where(:email => access_token.info.email).first
      if registered_user
        if access_token.info.image.present?
          registered_user.update_attributes(:provider => "google_oauth2", :image => access_token.info.image)
        end
        return registered_user
      else
        user = User.create(name: data["name"],
          provider:access_token.provider,
          email: data["email"],
          uid: access_token.uid ,
          password: Devise.friendly_token[0,20]
        )
        if access_token.info.image.present?
          user.update_attribute(:image, access_token.info.image)
        end
      end
    end
  end

  def send_welcome_mail
    UserMailer.send_new_user_message(self).deliver
  end
end
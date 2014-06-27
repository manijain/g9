class UserMailer < ActionMailer::Base
  default from: "manijain333@gmail.com"

  def send_new_user_message(user)
  	@user = user
    mail(:to => @user.email, :subject => "Welcome email.")
  end

  def send_new_poperty_message(property)
  	@property = property
    mail(:to => User.all.map(&:email), 
    	:subject => "New Property Added")
  end
end
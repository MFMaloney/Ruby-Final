class WelcomeEmail < ApplicationMailer
	def welcome_email(user)
		@user = user

		mail(to:       user.email,
			 subject: "Welcome to Trade Your Shit!")
	end
end

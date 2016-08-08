class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :ads

  default_scope do
		order("created_at DESC")
	end

  validates_uniqueness_of :name

  # after_create(:send_welcome_email)

 	# def send_welcome_email
 	# 	WelcomeMailer.welcome_email(self).deliver
 	# end
 	def self.search(search)
		search = "%#{search}%"
  		where("name LIKE ? OR email LIKE ? ", search, search)
	end
end

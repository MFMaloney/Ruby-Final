class Ad < ActiveRecord::Base
	belongs_to :user

	validates(:text,
 			presence: true)

	default_scope do
		order("created_at DESC")
	end

 has_attached_file :image, styles:
   {medium: "300x300>", thumb: "100x100>"},
   default_url: ':style/missing.png',
   storage: :s3,
   s3_credentials: Proc.new{|a| a.instance.s3_credentials }
   		def s3_credentials
   			{bucket: "mikesbucket88",
   			 access_key_id: "xxx",
   	       secret_access_key: "xxx"}
   	    end
   
   validates_attachment_content_type :image,
   content_type: /\Aimage\/.*\Z/

   def post_and_user
		"#{text} posted by #{user.name}"
	end

	def self.search(search)
      if search.present?
		  search = "%#{search.downcase}%"
  		  where("LOWER(text) LIKE ? OR LOWER(keywords) LIKE ?", search, search)
      else
        none
      end
	end
end

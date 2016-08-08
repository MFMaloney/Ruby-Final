module AdsHelper
	def edit_ad_link(ad)
		link_to("Edit This Post", edit_ad_url(ad))
	end
end

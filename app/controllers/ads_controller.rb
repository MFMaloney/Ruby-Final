class AdsController < ApplicationController
	before_action :authenticate_user!

	def index  		
    	@searched_ads = Ad.search(params[:search])
    	@recent_ads = Ad.limit(5)
	end

	def new
		@ad = Ad.new
	end

	def create
		@ad = Ad.create(ad_params.merge(user: current_user))
		if @ad.valid?
			redirect_to(@ad)
		end
	end

	def show
		find_ad
	end

	def edit
		find_ad
	end

	def update
		find_ad
		@ad.update(ad_params)
	end

	def destroy
		find_ad_by_current_user
		@ad.destroy
		flash[:notice] = ('Your posting was deleted')
		redirect_to ads_path
	end

private

	def find_ad_by_current_user
		@ad = current_user.ads.find(params[:id])
	end

	def find_ad
		@ad = Ad.find(params[:id])
	end

	def ad_params
		params.require(:ad).permit(:text, :image, :keywords)
	end
end

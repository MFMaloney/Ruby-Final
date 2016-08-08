class UsersController < ApplicationController
	def index
		@users = User.order("created_at DESC")
  		
  		if params[:search]
    		@users = @users.search(params[:search])
  		else
    		@users = @users.limit(50)
  		end
	end

	def show
		@user = User.find(params[:id])
	end
end

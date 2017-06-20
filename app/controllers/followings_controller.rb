class FollowingsController < ApplicationController

	before_action :set_user

	def create
		current_user.follow @user 
		redirect_to @user, notice: "Your're now following this user"
	end

	def destroy
		current_user.unfollow @user
		redirect_to @user, notice: "You no longer follow this user"
	end


	private

	def set_user
		@user = User.find(params[:user_id])
	end

end
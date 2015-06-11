class UsersController < ApplicationController
	def index
		@users = User.all
	end

	def new
		@user = User.new
	end

	def show
		@user = User.find params[:id]
	end

	def create
  		@user = User.create( user_params )
	end

	def delete
		@user.avatar = nil
		@user.save
	end

	private

# Use strong_parameters for attribute whitelisting
# Be sure to update your create() and update() controller methods.

	def user_params
	  params.require(:user).permit(:avatar, :name, :phone_number, :phone_num, :email, :image_url)
	end

end

class UsersController < ApplicationController
	def new
		@user = User.new
	end

	def welcome
		@user = User.new
	end

	def create
		@user = User.new(params[:user])

		respond_to do |format|
			if @user.save
				format.html { redirect_to @user, notice: 'user was successfully created.' }
				format.json { render json: @user, status: :created, location: @user }
			else
				    flash[:error] = "There were errors..."
				    render :action => :welcome
			end
		end
	end

	def show
		@user = User.find(params[:id])

		respond_to do |format|
		format.html # show.html.erb
		format.json { render json: @user }
		end
	end

	def thanks
		@user = User.find(params[:id])

		respond_to do |format|
		format.html # show.html.erb
		format.json { render json: @user }
		end
	end
end
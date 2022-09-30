class UserController < ApplicationController
	skip_before_action :verify_authenticity_token
	def create
		@data = User.new(first_name: params[:first_name], last_name: params[:last_name], date_of_birth: params[:date_of_birth], address: params[:address], email_id: params[:email_id],phone_no: params[:phone_no])
		if @data.save
			render json: {message: @data}
		else
			render json: {message: "something wrong"}
		end
	end

	def index
		@data = User.all
			
	    if @data.present?
			render json: (@data), status: :created
		else
			render json: {errors: "record not found"} , status: :unprocessable_entity
		end
	end

	def update
		@data = User.find(params[:id])
		if @data.update(first_name: params[:first_name], last_name: params[:last_name], date_of_birth: params[:date_of_birth], address: params[:address], email_id: params[:email_id],phone_no: params[:phone_no])
			render json: (@data), status: :ok
		else
			render json: {errors: "record not found"} , status: :unprocessable_entity
		end
	end

	def destroy
		@data = User.find(params[:id])
		@data.destroy
		render json: (@data), status: :ok
	end



end

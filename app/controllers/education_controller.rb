class EducationController < ApplicationController
	skip_before_action :verify_authenticity_token
	def create
		@data = User.find_by(id: create_params[:user_id])
		if @data.present?
			@edu = Education.create(create_params)
				if @edu.present?
					render json: {message: @edu}
				else
					render json: {message: "something wrong"}
				end
		end
	end

	def index
		@data = Education.all
			
	    if @data.present?
			render json: (@data), status: :created
		else
			render json: {errors: "record not found"} , status: :unprocessable_entity
		end
	end

	def update
		@data = Education.find(params[:id])
		if @data.update(create_params)
			render json: (@data), status: :ok
		else
			render json: {errors: "record not found"} , status: :unprocessable_entity
		end
	end

	def destroy
			@data = Education.find(params[:id])
		@data.destroy
			render json: (@data), status: :ok
	end

	private

	def create_params
		params.require(:data).permit(
			:first_name,
			:last_name,
			:college_name,
			:course,
			:branch,
			:user_id
		)
	end

end


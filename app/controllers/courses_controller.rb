class CoursesController < ApplicationController
	before_action :authorize_request
	def create
		@course = Course.new(courses_params)
    if @course.save
      render json: @course, status: :created
    else
      render json: { errors: @course.errors.full_messages },
             status: :unprocessable_entity
    end
	end

	private

	def courses_params
		params.permit(
      :title, :deposit_amount, :final_balance, :start_date, :default_coupon_amount)
	end
end

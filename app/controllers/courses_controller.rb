class CoursesController < ApplicationController
	before_action :authorize_request
	def create
		debugger
		@course = Course.new(courses_params)
    if @course.save
      render json: @course, status: :created
    else
      render json: { errors: @course.errors.full_messages },
             status: :unprocessable_entity
    end
	end

	private

	def genrate_coupon
		SecureRandom.base36
	end
end

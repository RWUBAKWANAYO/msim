class Api::V1::EnrollmentsController < ApplicationController
  include AuthenticationHelper

  def create
    course = Course.find(params[:course_id])
    if current_user.enrollments.exists?(course:)
      render json: { message: 'Course already enrolled' }, status: :unprocessable_entity
    else

      enrollment = Enrollment.new(course:, user: current_user, enrollment_date: Date.today)

      if enrollment.save
        render json: { message: 'Enrollment successful', enrollment: }, status: :created
      else
        render json: { message: 'Failed to enroll', errors: enrollment.errors.full_messages },
               status: :unprocessable_entity
      end
    end
  end

  def index

  end
end

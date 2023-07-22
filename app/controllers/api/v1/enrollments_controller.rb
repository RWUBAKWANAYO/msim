class Api::V1::EnrollmentsController < ApplicationController
  include AuthenticationHelper

  def create
    course = Course.find(params[:course_id])
    if current_user.enrollments.exists?(course:)
      render json: { message: 'Course already enrolled' }, status: :unprocessable_entity
    else


    end
  end


end

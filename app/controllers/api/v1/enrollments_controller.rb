class Api::V1::EnrollmentsController < ApplicationController
  include AuthenticationHelper

  def create
    course = Course.find(params[:course_id])
    if current_user.enrollments.exists?(course:)
  else


    end
  end


end

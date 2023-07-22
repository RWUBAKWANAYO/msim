class Api::V1::EnrollmentsController < ApplicationController
  include AuthenticationHelper

  def create
    course = Course.find(params[:course_id])



    end
  end


end

class Api::V1::CoursesController < ApplicationController
  def index
    courses = Course.all
    render json: courses, only: %i[name description], status: :ok
  end
end

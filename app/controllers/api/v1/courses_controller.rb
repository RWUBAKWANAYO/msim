class Api::V1::CoursesController < ApplicationController
  after_create :schedule_update
  def index
    courses = Course.all
    render json: courses, only: %i[name description], status: :ok
  end

  private

  def schedule_update
    CourseFetcherWorker.perform_in(30.seconds)
  end
end

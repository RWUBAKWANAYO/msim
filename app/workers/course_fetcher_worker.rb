
require 'net/http'

class CourseFetcherWorker
  include Sidekiq::Worker

  API_ENDPOINT = 'https://microverse-take-home-api.herokuapp.com/api/v1/courses'
  API_KEY = 'tooth.RED.bear.fork'

  def perform
    puts "Performing CourseFetcherWorker job......."

    begin
      uri = URI(API_ENDPOINT)
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true

      request = Net::HTTP::Get.new(uri.path)
      request['Authorization'] = "Bearer #{API_KEY}"

      response = http.request(request)

      if response.code == '200'
        courses = JSON.parse(response.body)
        process_courses(courses)
      else
        raise "Failed to fetch courses: #{response.body}"
      end
    rescue => e
      puts "Error: #{e.message}"
    end
    CourseFetcherWorker.perform_in(30.seconds)
  end

  private

def process_courses(courses)
  courses['data'].each do |course|
    process_course(course)
  end
end


def process_course(course)
  course_id = course['id']
  title = course['attributes']['title']
  description = course['attributes']['description']

  existing_course = Course.find_by(id: course_id)

    if existing_course
    puts "Skipping existing course with ID #{course_id}"
  else
    Course.create(id: course_id, name: title, description: description)
  end
end

end

require 'net/http'

class CourseFetcherWorker
  include Sidekiq::Worker

  API_ENDPOINT = 'https://microverse-take-home-api.herokuapp.com/api/v1/courses'.freeze
  API_KEY = 'tooth.RED.bear.fork'.freeze

  def perform
    puts 'Performing CourseFetcherWorker job.......'
    display_time
    begin
      uri = URI(API_ENDPOINT)
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true

      request = Net::HTTP::Get.new(uri.path)
      request['Authorization'] = "Bearer #{API_KEY}"

      response = http.request(request)

      raise "Failed to fetch courses: #{response.body}" unless response.code == '200'

      courses = JSON.parse(response.body)
      process_courses(courses)
    rescue StandardError => e
      puts "Error: #{e.message}"
    end
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
      Course.create(id: course_id, name: title, description:)
    end
  end

  def display_time
    duration = 2.minutes
    future_time = Time.now + duration
    formatted_time = future_time.strftime('%H:%M:%S')

    puts '--------------------------------------------------------'
  end
end

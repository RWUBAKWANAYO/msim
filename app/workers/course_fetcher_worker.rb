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


  end


  end




end

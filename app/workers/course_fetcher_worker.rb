require 'net/http'

class CourseFetcherWorker
  include Sidekiq::Worker

  API_ENDPOINT = 'https://microverse-take-home-api.herokuapp.com/api/v1/courses'.freeze
  API_KEY = 'tooth.RED.bear.fork'.freeze

  def perform
    puts 'Performing CourseFetcherWorker job.......'
    display_time


  end


  end




end

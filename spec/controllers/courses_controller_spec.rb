require 'rails_helper'
RSpec.describe 'Courses/index', type: :feature do
  before do
    @course = Course.create(name: 'course name', description: 'course description')
    visit api_v1_courses_path
  end
  context 'page status' do
    it 'Assert the response status' do
      expect(page.status_code).to eq(200)
    end
    it 'Make a GET request to the index action' do
      expect(page).to have_current_path(api_v1_courses_path)
    end
  end
  context 'page data' do
    it 'shows courses name' do
      expect(page).to have_content('course name')
    end
    it 'shows courses description' do
      expect(page).to have_content('course description')
    end
    it 'Assert the JSON structure and content' do
      parsed_response = JSON.parse(page.body)
      expect(parsed_response).to be_an(Array)
    end
  end
end

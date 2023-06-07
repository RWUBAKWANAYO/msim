require 'rails_helper'
RSpec.describe Course, type: :model do
  subject do
    Course.new(name: 'Math', description: 'Introduction to Calculus')
  end
  before { subject.save }
  context 'associations' do
    it 'has many enrollments' do
      assc = described_class.reflect_on_association(:enrollments)
      expect(assc.macro).to eq :has_many
    end
  end
  context 'validations' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end
    it 'is not valid without a name' do
      subject.name = nil
      expect(subject).to_not be_valid
    end
    it 'is not valid without a description' do
      subject.description = nil
      expect(subject).to_not be_valid
    end
    it 'is not valid with a duplicate name' do
      course = Course.new(name: 'Math', description: 'Introduction to Calculus')
      expect(course).to_not be_valid
    end
    it 'is not valid with a short description' do
      subject.description = 'short'
      expect(subject).to_not be_valid
    end
  end
end

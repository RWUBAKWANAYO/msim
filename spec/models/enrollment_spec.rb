require 'rails_helper'

RSpec.describe Enrollment, type: :model do
  subject do
  course = Course.create(name: "Math", description: "Introduction to Calculus")
  user = User.create(email: 'test@example.com', password: 'password');
    Enrollment.create(user: user, course: course, enrollment_date: Date.today)
  end
  before { subject.save }
  context 'associations' do
    it 'belongs to a user' do
      assc = described_class.reflect_on_association(:user)
      expect(assc.macro).to eq :belongs_to
    end
    it 'belongs to a course' do
      assc = described_class.reflect_on_association(:course)
      expect(assc.macro).to eq :belongs_to
    end
  end
  context 'validations' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end
    it 'is not valid without a user_id' do
      subject.user_id = nil
      expect(subject).to_not be_valid
    end
    it 'is not valid without a course_id' do
      subject.course_id = nil
      expect(subject).to_not be_valid
    end
    it 'is not valid with a duplicate user_id and course_id' do
      enrollment = Enrollment.new(user_id: 1, course_id: 1, enrollment_date: Date.today)
      expect(enrollment).to_not be_valid
    end
    it 'is not valid without an enrollment_date' do
      subject.enrollment_date = nil
      expect(subject).to_not be_valid
    end
  end
end
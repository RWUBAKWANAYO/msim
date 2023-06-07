require 'rails_helper'

RSpec.describe User, type: :model do
  subject do
    User.new(email: 'testuser@gmail.com', password: 'password')
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
    it 'is not valid without an email' do
      subject.email = nil
      expect(subject).to_not be_valid
    end
    it 'is not valid without a password' do
      subject.password = nil
      expect(subject).to_not be_valid
    end
    it 'is not valid with a duplicate email' do
      user = User.new(email: 'testuser@gmail.com', password: 'password')
      expect(user).to_not be_valid
    end
    it 'is not valid with a short password' do
      subject.password = 'short'
      expect(subject).to_not be_valid
    end

  end
end
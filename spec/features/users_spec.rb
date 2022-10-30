require 'rails_helper'

RSpec.describe User, type: :model do
  subject do
    User.new(name: 'John', email: 'john@gmail.com', password: '123456')
  end

  before { subject.save }

  context 'Return valid data' do
    it 'should accept name' do
      subject.name = 'John'
      expect(subject).to be_valid
    end
    it 'should accept email' do
      subject.email = 'john@gmail.com'
      expect(subject).to be_valid
    end
  end

  context 'Return invalid data' do
    it 'should not accept blank email' do
      subject.email = nil
      expect(subject).to_not be_valid
    end

    it 'should not accept blank name' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'should not accept blank password' do
      subject.password = nil
      expect(subject).to_not be_valid
    end
  end
end

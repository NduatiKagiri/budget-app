require 'rails_helper'

RSpec.describe Category, type: :model do
  subject do
    Category.new(name: 'category 1', icon: 'icon')
  end

  before { subject.save }

  context 'Return invalid data' do
    it 'should not accept blank name' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'should not accept blank icon' do
      subject.icon = nil
      expect(subject).to_not be_valid
    end
  end
end

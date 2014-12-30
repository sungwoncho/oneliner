require 'rails_helper'

RSpec.describe Oneline, :type => :model do
  it 'has a valid factory' do
    expect(build(:oneline)).to be_valid
  end

  describe 'validation' do
    it { should validate_presence_of(:subject) }
    it { should validate_presence_of(:definition) }
  end
end

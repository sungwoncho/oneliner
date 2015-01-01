require 'rails_helper'

RSpec.describe Vote, :type => :model do

  it 'has a valid factory' do
    expect(build(:vote)).to be_valid
  end

  describe 'association' do
    it { should belong_to(:user) }
    it { should belong_to(:oneline) }
  end

  describe 'validation' do
    it { should validate_presence_of(:vote_type) }
  end
end

require 'rails_helper'

RSpec.describe Oneline, :type => :model do
  it 'has a valid factory' do
    expect(build(:oneline)).to be_valid
  end
end

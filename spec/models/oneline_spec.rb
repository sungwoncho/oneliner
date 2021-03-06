require 'rails_helper'

RSpec.describe Oneline, :type => :model do
  it 'has a valid factory' do
    expect(build(:oneline)).to be_valid
  end

  describe 'validation' do
    it { should validate_presence_of(:subject) }
    it { should validate_presence_of(:definition) }
  end

  describe 'association' do
    it { should belong_to(:author).class_name('User').with_foreign_key('author_id') }
    it { should have_many(:votes) }
    it { should have_many(:upvotes) }
    it { should have_many(:downvotes) }
  end

  describe 'instance methods' do

    let(:user) { create(:user) }
    let(:user_2) { create(:user) }
    let(:oneline) { create(:oneline, author_id: user.id) }

    describe '#is_author?' do
      context 'when current user is author of oneline' do
        specify { expect(oneline.is_author?(user)).to be true }
      end

      context 'when current user is not the author' do
        specify { expect(oneline.is_author?(user_2)).to be false }
      end

      context 'when user is nil' do
        specify { expect(oneline.is_author?(nil)).to be false }
      end
    end

    describe '#upvote_count' do
      it 'counts the upvote' do
        3.times { create(:vote, oneline: oneline, vote_type: 'up') }

        expect(oneline.upvote_count).to eq 3
      end
    end

    describe '#downvote_count' do
      it 'counts the downvote' do
        3.times { create(:vote, oneline: oneline, vote_type: 'down') }

        expect(oneline.downvote_count).to eq 3
      end
    end
  end
end

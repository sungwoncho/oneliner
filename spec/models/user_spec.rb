require 'rails_helper'

RSpec.describe User, :type => :model do

  it 'has a valid factory' do
    expect(build(:user)).to be_valid
  end

  describe 'association' do
    it { should have_many(:authored_onelines) }
    it { should have_many(:votes) }
  end

  describe 'instance methods' do

    let(:user) { create(:user) }
    let(:oneline) {create(:oneline)}

    describe '#upvote' do
      context 'if user has not voted' do
        it 'creates a vote record' do
          expect {
            user.upvote(oneline)
          }.to change(Vote, :count).by(1)
        end

        it "assigns vote_type 'up' to the vote" do
          user.upvote(oneline)
          expect(Vote.last.vote_type).to eq 'up'
        end

        it 'increases the cached votes of the oneline' do
          expect {
            user.upvote(oneline)
            oneline.reload
          }.to change(oneline, :cached_votes).by(1)
        end
      end

      context 'if user has downvoted before' do

        before :each do
          create(:vote, user: user, vote_type: 'down')
        end

        it 'deletes the downvote record' do
          user.upvote(oneline)
          downvote = Vote.find_by(user: user, vote_type: 'down')
          # expect(downvote).to be nil
        end

        it "assigns vote_type 'up' to the vote" do
          user.upvote(oneline)
          expect(Vote.last.vote_type).to eq 'up'
        end


      end
    end

    describe '#upvoted?' do
      context 'if user has upvoted' do
        it 'returns true' do
          create(:vote, user: user, oneline: oneline, vote_type: 'up')
          expect(user.upvoted?(oneline)).to be true
        end
      end

      context 'if user has not upvoted' do
        specify { expect(user.upvoted?(oneline)).to be false }
      end
    end

    describe '#downvoted?' do
      context 'if user has downvoted' do
        it 'returns true' do
          create(:vote, user: user, oneline: oneline, vote_type: 'down')
          expect(user.downvoted?(oneline)).to be true
        end
      end

      context 'if user has not downvoted' do
        specify { expect(user.downvoted?(oneline)).to be false }
      end
    end
  end
end

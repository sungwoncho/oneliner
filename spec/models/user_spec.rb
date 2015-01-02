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
    let(:oneline) {create(:oneline, author_id: user.id)}

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
          create(:vote, user: user, oneline: oneline, vote_type: 'down')
        end

        it "changes the vote_type of the record to up" do
          vote = Vote.find_by(user: user, vote_type: 'down')

          user.upvote(oneline)
          vote.reload

          expect(vote.vote_type).to eq 'up'
        end

        it 'increases the cached_votes by 2' do
          expect {
            user.upvote(oneline)
          }.to change(oneline, :cached_votes).by(2)
        end

      end

      context 'if user has upvoted before' do

        before :each do
          create(:vote, user: user, oneline: oneline, vote_type: 'up')
        end

        it 'delete the vote' do
          expect {
            user.upvote(oneline)
          }.to change(Vote, :count).by(-1)
        end

        it 'decreases the cached_votes by 1' do
          expect {
            user.upvote(oneline)
          }.to change(oneline, :cached_votes).by(-1)
        end
      end
    end

    describe '#downvote' do
      context 'when user has not voted' do
        it 'creates a vote record' do
          expect {
            user.downvote(oneline)
          }.to change(Vote, :count).by(1)
        end

        it "assigns 'down' to vote_type" do
          user.downvote(oneline)
          expect(Vote.last.vote_type).to eq 'down'
        end

        it 'decreases the cached_votes by 1' do
          expect {
            user.downvote(oneline)
          }.to change(oneline, :cached_votes).by(-1)
        end
      end

      context 'when user has upvoted before' do

        before :each do
          create(:vote, user: user, oneline: oneline, vote_type: 'up')
        end

        it "changes the vote_type of the record to down" do
          vote = Vote.find_by(user: user, vote_type: 'up')

          user.downvote(oneline)
          vote.reload

          expect(vote.vote_type).to eq 'down'
        end

        it 'decreases the cached_votes by 2' do
          expect {
            user.downvote(oneline)
          }.to change(oneline, :cached_votes).by(-2)
        end
      end

      context 'when user has downvoted before' do

        before :each do
          create(:vote, user: user, oneline: oneline, vote_type: 'down')
        end

        it 'delete the vote' do
          expect {
            user.downvote(oneline)
          }.to change(Vote, :count).by(-1)
        end

        it 'increases the cached_votes by 1' do
          expect {
            user.downvote(oneline)
          }.to change(oneline, :cached_votes).by(1)
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

    describe '#total_upvotes_received' do
      it 'counts the total number of upvotes received' do
        create(:vote, user_id: 2, oneline: oneline, vote_type: 'up')
        create(:vote, user_id: 3, oneline: oneline, vote_type: 'up')
        create(:vote, user_id: 4, oneline: oneline, vote_type: 'up')

        expect(user.total_upvotes_received).to eq 3
      end
    end

    describe '#total_downvotes_received' do
      it 'counts the total number of downvotes received' do
        create(:vote, user_id: 2, oneline: oneline, vote_type: 'down')
        create(:vote, user_id: 3, oneline: oneline, vote_type: 'down')
        create(:vote, user_id: 4, oneline: oneline, vote_type: 'down')

        expect(user.total_downvotes_received).to eq 3
      end
    end

    describe '#wisdom' do
      it 'returns total upvotes - total downvotes' do
        create(:vote, user_id: 2, oneline: oneline, vote_type: 'up')
        create(:vote, user_id: 3, oneline: oneline, vote_type: 'up')
        create(:vote, user_id: 4, oneline: oneline, vote_type: 'down')

        expect(user.wisdom).to eq 1
      end
    end
  end
end

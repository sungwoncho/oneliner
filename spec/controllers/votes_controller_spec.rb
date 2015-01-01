require 'rails_helper'

RSpec.describe VotesController, :type => :controller do

  render_views

  let(:json) { JSON.parse(response.body, symbolize_names: true) }

  let(:user) { create(:user) }
  let(:oneline) { create(:oneline) }

  before :each do
    sign_in user
  end

  describe 'POST create' do
    it 'requires login' do
      sign_out user
      post :create, format: :json, id: oneline
      expect(response).to require_login
    end

    it 'returns 201' do
      post :create, format: :json, id: oneline, vote_type: 'up'
      expect(response.status).to eq 201
    end

    context "with vote_type 'up'" do
      it "returns upvoted 'true'" do
        post :create, format: :json, id: oneline, vote_type: 'up'
        expect(json[:upvoted]).to eq true
      end
    end

    context "with vote_type 'down'" do
      it "returns downvoted 'true'" do
        post :create, format: :json, id: oneline, vote_type: 'down'
        expect(json[:downvoted]).to eq true
      end
    end
  end
end

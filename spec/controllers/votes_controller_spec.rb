require 'rails_helper'

RSpec.describe VotesController, :type => :controller do

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
  end
end

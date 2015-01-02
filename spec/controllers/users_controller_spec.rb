require 'rails_helper'

RSpec.describe UsersController, :type => :controller do

  let(:user) { create(:user) }
  let(:oneline) { create(:oneline) }

  describe 'GET show' do
    before :each do
      get :show, id: user
    end

    it 'assigns the requested user to @user' do
      expect(assigns(:user)).to eq user
    end

    it 'decorated @user' do
      expect(assigns(:user)).to be_decorated
    end
  end
end

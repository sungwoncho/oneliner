require 'rails_helper'

RSpec.describe StaticPagesController, :type => :controller do
  describe 'GET #home' do
    it 'does not require login' do
      get :home
      expect(response).not_to require_login
    end
  end
end

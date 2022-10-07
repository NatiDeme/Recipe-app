require 'rails_helper'

RSpec.describe 'Foods', type: :request do
  describe 'GET /index' do
    before(:example) { get foods_path }
    it 'returns http success' do
      # get '/foods'
      expect(response).to have_http_status(:success)
    end
  end
end

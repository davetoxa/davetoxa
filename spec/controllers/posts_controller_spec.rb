require 'spec_helper'

describe PostsController do
  describe 'GET #index' do
    it 'index responds with HTTP 200 status code' do
      get :index
      expect(response).to be_success
      expect(response.status).to eq(200)
    end
  end
end

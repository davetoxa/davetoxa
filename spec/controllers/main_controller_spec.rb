require 'spec_helper'

describe MainController do
  describe 'GET #index' do
    it 'index responds with HTTP 200 status code' do
      get :index
      expect(response).to be_success
      expect(response.status).to eq(200)
    end

    it 'plan responds with HTTP 200 status code' do
      get :plan
      expect(response).to be_success
      expect(response.status).to eq(200)
    end

  end
end
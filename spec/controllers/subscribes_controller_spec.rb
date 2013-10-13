require 'spec_helper'

describe SubscribesController do

  describe 'GET #new' do
    it 'assigns a new Subscribe to @subscribe' do
      get :new
      expect(assigns :subscribe).to be_a_new(Subscribe)
      expect(response).to be_success
    end
  end
  describe 'POST #create' do
    it 'create subscribe' do
      expect{
        post :create, subscribe: FactoryGirl.build(:subscribe, email: 'test@gmail.com').attributes
      }.to change(Subscribe,:count).by(1)
    end

    it 'redirect after creating subscribe' do
      post :create, subscribe: FactoryGirl.create(:subscribe, email: 'test@gmail.com').attributes
      expect(response).to be_success
      expect(response.location).to eq '/'
    end
  end
end

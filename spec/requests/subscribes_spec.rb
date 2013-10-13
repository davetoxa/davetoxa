require 'spec_helper'

describe 'Subscribe' do
  subject { page }
  describe 'Guest' do

    it 'did not show subscribes for guest' do
      get subscribes_path
      expect(response).to be_redirect
      expect(flash[:alert]).to eq I18n.t('unauthorized.default')
    end

    it 'create subscribe' do
      visit new_subscribe_path
      within 'form#new_subscribe' do
        fill_in :email, with: Faker::Internet.email
        click_button I18n.t('main.index.subscribe')
      end
      expect(page).to have_content I18n.t('flash.actions.create.notice')
    end

  end
end
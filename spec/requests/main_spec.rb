require 'spec_helper'

describe 'Main' do
  describe 'main#index' do
    before(:each) { visit root_path }
    it 'has title & description' do
      expect(page).to have_content I18n.t('layouts.header.title')
      expect(page).to have_content I18n.t('layouts.header.description')
    end
    it 'has search field' do
      expect(page).to have_css 'input.search-query'
    end
    it 'has footer links' do
      expect(page).to have_link 'Twitter'
      expect(page).to have_link 'Github'
    end
  end
  describe 'main#admin' do
    let!(:user){ create :user }
    before(:each) do
      auth user
      visit admin_path
    end
    it 'show accesss denied for usual user' do
      expect(page).to have_content 'Access denied'
    end
  end

end
require 'spec_helper'

describe 'Main' do
  describe 'main#index' do
    before(:each) { visit root_path }

    it 'has subscribe link' do
      expect(page).to have_link I18n.t('main.index.subscribe')
    end

    it 'has welcome text intro' do
      expect(page).to have_content I18n.t('main.index.hello')
      expect(page).to have_content I18n.t('main.index.text_part1')
      expect(page).to have_content I18n.t('main.index.text_part2')
    end

    it 'has author name link' do
      expect(page).to have_link 'Anton Cherepanov'
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
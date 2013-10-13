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
      expect(page).to have_content I18n.t('main.index.text_part3')
    end

    it 'has author name link' do
      expect(page).to have_link 'Anton Cherepanov'
    end
  end

  describe 'main#plan' do
    before(:each) { visit '/plan' }

    it 'has plan intro' do
      expect(page).to have_content I18n.t('main.plan.title')
    end

  end
end
require 'spec_helper'

describe 'User' do
  subject { page }
  let!(:user){ create :user, email: 'user@example.com', password: '12345' }

  describe 'Guest' do
    it 'входит в приложение' do
      visit new_user_session_path
      within 'form#new_user' do
        fill_in 'Секретное слово', with: user.email
        fill_in 'Второе секретное слово',  with: user.password
        click_button I18n.t('layouts.header.login')
      end
      expect(page).to have_content I18n.t('devise.sessions.signed_in')
    end
  end
end
require 'spec_helper'

describe 'User' do
  subject { page }

  context 'user' do
    let!(:user){ create :user }
    before {auth user}

    it 'login' do
      expect(page).to_not have_content I18n.t('layouts.header.login')
      expect(page).to have_css ".user-link"
    end

    it 'logout' do
      visit edit_profile_path(user)
      click_link I18n.t("profile.edit.exit")
      expect(page).to have_content I18n.t("devise.sessions.signed_out")
    end
  end

  context 'admin' do
    let!(:admin){ create :admin }
    before {auth admin}

    it 'login and has admin link' do
      expect(page).to have_content I18n.t('layouts.header.admin')
    end
  end
end

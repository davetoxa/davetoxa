require 'spec_helper'

describe 'User' do
  subject { page }

    context 'usual' do
      let!(:user){ create :user }
      before {auth user}
      it 'login' do
        expect(page).to_not have_content I18n.t('layouts.header.login')
        expect(page).to have_css ".user-link"
      end
    end

    context 'admin' do
      let!(:admin){ create :admin }
      before {auth admin}
      it 'login and has admin link' do
        expect(page).to_not have_content I18n.t('layouts.header.login')
        expect(page).to have_css ".user-link"
        expect(page).to have_content I18n.t('layouts.header.subscribers')
      end
    end
end

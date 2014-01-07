require 'spec_helper'

describe 'Main' do
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
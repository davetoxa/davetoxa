require 'spec_helper'

describe 'User' do
  subject { page }
  let!(:user){ create :user }

  describe 'Guest' do
    it 'входит в приложение'
  end
end
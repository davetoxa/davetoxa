require 'spec_helper'

describe 'Comment' do
  let(:user) { create :user }
  let(:post) { create :post }

  before do
    auth user
    visit post_path(post)

    within('#new_comment') do
      fill_in 'comment_body', with: 'First comment'
      click_button I18n.t 'create'
    end
  end

  it 'create comment' do
    expect(page).to have_content 'First comment'
  end

  it 'delete comment' do
    click_link 'delete'
    expect(page).not_to have_content 'First comment'
  end
end

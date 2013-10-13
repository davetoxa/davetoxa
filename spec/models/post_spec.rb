require 'spec_helper'

describe Post do
  let(:user) { create :user }
  let(:post) { create(:post, user: user) }

  describe 'validation' do
    it 'dont create post without title'  do
      post.title = ''
      expect(post).not_to be_valid
    end

    it 'dont create post without content' do
      post.content = ''
      expect(post).not_to be_valid
    end

  end

end

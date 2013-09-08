require 'spec_helper'

describe Post do
  let(:user) { create :user }
  let(:post) { create(:post, user: user) }

  describe 'validation' do
    it 'Не создаёт пост без заголовка'  do
      post.title = ''
      expect(post).not_to be_valid
    end

    it 'Не создаёт пост без содержания' do
      post.content = ''
      expect(post).not_to be_valid
    end

  end

end

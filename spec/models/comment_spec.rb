require 'spec_helper'

describe Comment do
  let(:comment){ create :comment }
  it 'not valid without body' do
    comment.body = ''
    expect(comment).not_to be_valid
  end
end

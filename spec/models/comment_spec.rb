require 'rails_helper'

RSpec.describe Comment, type: :model do
  let!(:user) { create(:user) }
  let!(:post)  { create(:post, user: user)}
  let!(:comment){ build(:comment, user: user, post: post)}

  context 'contentが入力されている場合' do
    it 'コメントを保存できる' do
      expect(comment).to be_valid
    end
  end

  context 'contentが入力されていない場合' do
    before do
      comment.content = nil
      comment.save
    end
    it 'コメントを保存できない' do
      expect(comment.errors.full_messages).to eq(['コメントを入力してください'])
    end
  end
end

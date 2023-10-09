require 'rails_helper'

RSpec.describe Post, type: :model do
  let!(:user) { create(:user)}

  context 'タイトル、内容、画像が入力されている場合'
    let!(:post)  { build(:post, user: user)}

    it 'タイトルと内容が入力されていれば投稿を保存できる' do
      expect(post).to be_valid
    end

    context 'タイトルが40文字の場合' do
      let!(:post)  { build(:post, title:Faker::Lorem.characters(number: 40),  user: user)}

      before do
        post.save
      end

      it '投稿を保存できない' do
        expect(post.errors.messages[:title][0]).to eq('は30文字以内で入力してください')
      end
    end
end

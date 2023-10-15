require 'rails_helper'

RSpec.describe Post, type: :model do
  let!(:user) { create(:user)}

  context 'タイトル、内容、画像が入力されている場合' do
    let!(:post)  { build(:post, user: user)}

    it '投稿を保存できる' do
      expect(post).to be_valid
    end
  end

    describe 'title' do
      context 'titleが未入力の場合' do
        let!(:post)  { build(:post, title:'',  user: user)}

        before do
          post.save
        end

        it '投稿を保存できない' do
          expect(post.errors.full_messages).to eq(['タイトルを入力してください'])
        end
      end

      context 'titleが31文字以上の場合' do
        let!(:post)  { build(:post, title:Faker::Lorem.characters(number: 40),  user: user)}

        before do
          post.save
        end

        it '投稿を保存できない' do
          expect(post.errors.full_messages).to eq(['タイトルは30文字以内で入力してください'])
        end
      end
    end

    describe 'content' do
      context 'contentが未入力の場合' do
        let!(:post)  { build(:post, content:'',  user: user)}

        before do
          post.save
        end

        it '投稿を保存できない' do
          expect(post.errors.full_messages).to eq(['投稿内容を入力してください'])
        end
      end

      context 'contenteが141文字以上の場合' do
        let!(:post)  { build(:post, content:Faker::Lorem.characters(number: 150),  user: user)}

        before do
          post.save
        end

        it '投稿を保存できない' do
          expect(post.errors.full_messages).to eq(['投稿内容は140文字以内で入力してください'])
        end
      end
    end

    describe 'image' do
      context 'imageが未入力の場合' do
        user = User.create(account: 'account', email: 'test@test.com', password: 'password')
        post = user.posts.build(title: 'Sample Post', content: 'This is a sample post content.')

        it '投稿を保存できない' do
          expect(post).to_not be_valid
        end
      end
    end
end

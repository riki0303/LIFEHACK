require 'rails_helper'

RSpec.describe Post, type: :model do
  let!(:user) { create(:user)}

  context 'タイトル、内容、画像が入力されている場合'
    let!(:post)  { build(:post, user: user)}

    it '投稿を保存できる' do
      expect(post).to be_valid
    end

    describe 'title' do
      context 'titleが未入力の場合' do
        let!(:post)  { build(:post, title:'',  user: user)}

        before do
          post.save
        end

        it '投稿を保存できない' do
          expect(post).to_not be_valid
        end
      end

      context 'titleが31文字以上の場合' do
        let!(:post)  { build(:post, title:Faker::Lorem.characters(number: 40),  user: user)}

        before do
          post.save
        end

        it '投稿を保存できない' do
          expect(post).to_not be_valid
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
          expect(post).to_not be_valid
        end
      end

      context 'contenteが141文字以上の場合' do
        let!(:post)  { build(:post, content:Faker::Lorem.characters(number: 150),  user: user)}

        before do
          post.save
        end

        it '投稿を保存できない' do
          expect(post).to_not be_valid
        end
      end
    end
end

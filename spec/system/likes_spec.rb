require 'rails_helper'

RSpec.describe 'Likes', type: :system do
  let!(:user) { create(:user) }
  let!(:post) { create(:post, user: user) }

  context 'ログインしている場合' do
    before do
      sign_in user
    end

    context '未いいねの記事に対して' do
      it 'いいねを作成出来る' do
        visit posts_path
        find('.like__inactive-heart').click
        expect(page).to have_css('.like__active-heart')
      end
    end

    context 'いいね済みの記事に対して' do
      let!(:like) { create(:like, user: user, post: post) }
      it 'いいねを削除出来る' do
        visit posts_path
        find('.like__active-heart').click
        expect(page).to have_css('.like__inactive-heart')
      end
    end

  end
end

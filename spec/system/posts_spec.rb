require 'rails_helper'

RSpec.describe 'Post', type: :system do
  let!(:user) { create(:user) }
  let!(:posts) { create_list(:post, 3, user: user) }

  context 'ログインしている場合' do
    before do
      sign_in user
    end
    it '記事一覧が表示される' do
      visit posts_path
      posts.each do |post|
        expect(page).to have_css('.post__image')
        expect(page).to have_css('.post__title', text: post.title)
        expect(page).to have_css('.post__content', text: post.content)
      end
    end

    it '記事詳細が表示される' do
      visit posts_path
      post = posts.first
      # 投稿画像をクリック(alt = post.title)
      click_on post.title
      expect(page).to have_css('.post__image')
      expect(page).to have_css('.post__title', text: post.title)
      expect(page).to have_css('.post__content', text: post.content)
    end
  end
end
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

    it '自分の記事の編集ボタンがクリックできる' do
      visit posts_path
      first('.post__tab').click
      click_on('編集')
      expect(current_path).to eq edit_post_path(posts.last.id)
    end
  end
end
require 'rails_helper'

RSpec.describe 'Post', type: :system do
  let!(:user) { create(:user) }
  let!(:post) { create(:post, user: user) }

  context 'ログインしている場合' do
    before do
      sign_in user
    end
    it '記事一覧が表示される' do
      visit posts_path
      expect(page).to have_css('.post__image')
      expect(page).to have_css('.post__title', text: post.title)
      expect(page).to have_css('.post__content', text: post.content)
    end



    describe '投稿の編集' do
      context '自分の投稿の場合' do
        it '記事の編集・削除ボタンが表示されクリックできる' do
          visit posts_path
          find('.post__tab').click
          click_on('編集')
          expect(current_path).to eq edit_post_path(post.id)
        end
      end

      context '他人の投稿の場合' do
        let!(:user2) { create(:user) }
        let!(:user2_post) { create(:post, user: user2) }

        before { post.destroy }
        it '他人の記事の編集・削除ボタンはクリックできない' do
          visit posts_path
          expect {
            find('.post__tab').click
          }.to raise_error(Capybara::ElementNotFound)
          expect(current_path).to eq posts_path
        end
      end
    end
  end
end
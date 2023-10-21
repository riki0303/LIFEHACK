require 'rails_helper'

RSpec.describe 'Post', type: :system do
  let!(:user) { create(:user) }
  let!(:post) { create(:post, user: user) }
  let!(:comment) { create(:comment, user: user, post: post) }

  context 'ログインしている場合' do
    before do
      sign_in user
    end
    context '自分のコメント' do
      it 'コメントが表示される' do
        visit post_path(post.id)
        expect(page).to have_css('.comment__avatar')
        expect(page).to have_css('.comment__account')
        expect(page).to have_css('.comment__content')
        expect(page).to have_css('.comment__destory-link')
      end
      it 'コメントを削除出来る' do
        visit post_path(post.id)
        find('.comment__destory-link').click
        page.driver.browser.switch_to.alert.accept
        expect(page).to_not have_css('.commnet__item')
      end
    end

    context '別ユーザーコメント'do
    let!(:user2) { create(:user) }
    let!(:comment2) { create(:comment, user: user2, post: post) }
    before { comment.destroy }
      it 'コメントを削除出来ない' do
        visit post_path(post.id)
        expect(page).to_not have_css('.comment__destory-link')
      end
    end
  end
end
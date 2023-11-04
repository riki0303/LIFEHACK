require 'rails_helper'

RSpec.describe 'Likes', type: :system do
  let!(:user) { create(:user) }
  let!(:user2) { create(:user) }

  context 'ログインしている場合' do
    before do
      sign_in user
    end

    context 'フォロー済みユーザーに対して' do
      let!(:relationship) { create(:relationship, follower: user, following: user2) }
      it 'フォローを削除出来る' do
        visit account_path(user2.id)
        find('.profile__link--unfollow').click
        page.driver.browser.switch_to.alert.accept
        expect(page).to have_css('.profile__link--follow')
      end
    end
  end
end

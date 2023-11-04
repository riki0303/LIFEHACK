require 'rails_helper'

RSpec.describe 'Likes', type: :system do
  let!(:user) { create(:user) }
  let!(:user2) { create(:user) }

  context 'ログインしている場合' do
    before do
      sign_in user
    end

    context '未フォローのユーザーに対して' do
      it 'フォローを作成出来る' do
        visit account_path(user2.id)
        find('.profile__link--follow').click
        expect(page).to have_css('.profile__link--unfollow')
      end
    end
  end
end

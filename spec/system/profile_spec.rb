require 'rails_helper'

RSpec.describe 'Profile', type: :system do
  let!(:user) { create(:user) }
  let!(:profile) { create(:profile, user: user) }
  let!(:posts) { create_list(:post, 3, user: user) }

  context 'ログインしている場合' do
    before do
      sign_in user
    end

    it 'プロフィールを表示できる' do
      visit profile_path
      expect(page).to have_css('.profile__name', text: user.profile.name)
      expect(page).to have_css('.profile__bio', text: user.profile.bio)
      expect(page).to have_css('.profile__avatar')
    end
  end
end

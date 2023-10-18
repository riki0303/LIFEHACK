require 'rails_helper'

RSpec.describe 'Api::Unfollows', type: :request do
  let!(:user) { create(:user) }
  let!(:user2) { create(:user) }

  context 'ログインしている場合' do
    before do
      sign_in user
    end

    describe 'POST /api/like' do
      let!(:relationship) { create(:relationship, follower: user, following: user2) }
      it 'アンフォローできる' do
        post account_unfollow_path(user2.id)
        body = JSON.parse(response.body)
        expect(response.status).to eq(200)
        expect(body).to eq({ 'status'=>'ok', 'followersCount'=>user2.follower_relationships.count })
      end
    end
  end
end

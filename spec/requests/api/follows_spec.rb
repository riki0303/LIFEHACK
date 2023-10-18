require 'rails_helper'

RSpec.describe 'Api::Follows', type: :request do
  let!(:user) { create(:user) }
  let!(:user2) { create(:user) }

  context 'ログインしている場合' do
    before do
      sign_in user
    end

    describe 'GET /api/follows' do
      let!(:relationship) { create(:relationship, follower: user, following: user2) }
      it 'JSONを取得できる' do
        get account_follow_path(user2.id)
        body = JSON.parse(response.body)
        expect(response.status).to eq(200)
        expect(body).to eq({ 'hasFollowed'=>true })
      end
    end

    describe 'POST /api/like' do
      it 'フォロー出来る' do
        post account_follow_path(user2.id)
        body = JSON.parse(response.body)
        expect(response.status).to eq(200)
        expect(body).to eq({ 'status'=>'ok', 'followersCount'=>user2.follower_relationships.count })
      end
    end
  end
end

require 'rails_helper'

RSpec.describe 'Api::Likes', type: :request do
  let!(:user) { create(:user) }
  let!(:post) { create(:post, user: user) }

  context 'ログインしている場合' do
    before do
      sign_in user
    end

    describe 'GET /api/likes' do
      let!(:like) { create(:like, user: user, post: post) }
      it 'JSONを取得できる' do
        get post_like_path(post.id)
        body = JSON.parse(response.body)
        expect(response.status).to eq(200)
        expect(body).to eq({ 'hasLiked'=>true })
      end
    end

    # describe 'POST /api/like' do
    #   it 'いいね出来る' do
    #     post post_like_path(post.id)
    #     body = JSON.parse(response.body)
    #     expect(response.status).to eq(200)
    #     expect(body).to eq({ 'likesCount'=>1, 'status'=>'ok' })
    #   end
    # end

    describe 'DELETE /api/likes' do
      let!(:like) { create(:like, user: user, post: post) }
      it 'いいねを削除できる' do
        delete post_like_path(post.id)
        body = JSON.parse(response.body)
        expect(response.status).to eq(200)
        expect(body).to eq({ 'likesCount'=>0, 'status'=>'ok' })
      end
    end
  end
end

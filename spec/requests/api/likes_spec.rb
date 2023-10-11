require 'rails_helper'

RSpec.describe 'Api::Likes', type: :request do
  let!(:user) { create(:user) }
  let!(:post) { create(:post, user: user) }
  let!(:like) { create(:like, user: user, post: post) }

  describe 'GET /api/likes' do
    context 'ログインしている場合' do
      before do
        sign_in user
      end
      it 'JSONを取得できる' do
        get post_like_path(post_id = post.id)
        body = JSON.parse(response.body)
        expect(body).to eq({'hasLiked'=>true})
      end
    end
  end
end

require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  let!(:user) { create(:user) }
  let!(:posts) { create_list(:post, 3, user: user) }


  describe 'GET /posts' do
    context 'ログインしている場合' do
      before do
        sign_in user
      end
      it '200ステータスが返ってくる' do
        get posts_path
        expect(response).to have_http_status(200)
      end

      describe 'POST /posts' do
        it '記事を投稿できる' do
          post_params = attributes_for(:post, image: fixture_file_upload('test.jpeg'))
          post posts_path, params: { post: post_params }
          expect(response).to redirect_to(posts_path)
          expect(Post.last.title).to eq(post_params[:title])
          expect(Post.last.content).to eq(post_params[:content])
        end
      end
    end

    context 'ログインしていない場合' do
      it 'ログインページへリダイレクトされる' do
        get posts_path
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end
end
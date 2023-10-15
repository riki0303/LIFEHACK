require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  let!(:user) { create(:user) }
  let!(:posts) { create_list(:post, 3, user: user) }


  context 'ログインしている場合' do
    before do
      sign_in user
    end


    describe 'GET /posts' do
      it '記事一覧ページで200ステータスが返ってくる' do
        get posts_path
        expect(response).to have_http_status(200)
      end
    end

    describe 'GET /posts/:id' do
      it '記事詳細ページで200ステータスが返ってくる' do
        get post_path(Post.first.id)
        expect(response).to have_http_status(200)
      end
    end

    describe 'GET /posts/new' do
      it '新規投稿ページで200ステータスが返ってくる' do
        get new_post_path
        expect(response).to have_http_status(200)
      end
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

    describe 'GET/post/id/edit' do
      it '記事編集ページで200ステータスが返ってくる' do
        get edit_post_path(Post.first.id)
        expect(response).to have_http_status(200)
      end
    end

    describe 'PATCH/post/id' do
      it '記事を編集出来る' do
        patch post_path(Post.first.id), params: { post: {title: 'update_title', content: 'update_content', image:fixture_file_upload('test.jpeg') } }
        expect(response).to redirect_to(posts_path)
        expect(Post.first.title).to eq('update_title')
        expect(Post.first.content).to eq('update_content')
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
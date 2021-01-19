require 'rails_helper'

RSpec.describe 'Sessions', type: :system do
  let!(:user) { create(:user, name: 'Alice', email: 'alice@example.com', password: '00000000') }

  describe 'Login View' do
    context 'before login' do
      it 'display items' do
        visit new_user_session_path
        expect(page).to have_content 'パスワードを保存しておく'
        expect(page).to have_link '新規登録', href: new_user_registration_path
      end
    end
  end

  describe 'Login Function' do
    before do
      visit new_user_session_path
    end

    context 'when input valid contents' do
      it 'move user-post-view and display items' do
        fill_in 'user_email', with: 'alice@example.com'
        fill_in 'user_password', with: '00000000'
        click_button 'ログイン'
        expect(current_path).to eq user_path(user)
        expect(page).to have_content 'ログインしました。'
      end
    end

    context 'when input invalid contents' do
      it 'fail login and display error-item' do
        fill_in 'user_email', with: 'tommy@example'
        fill_in 'user_password', with: '00000000'
        click_button 'ログイン'
        expect(page).to have_content 'メールアドレスまたはパスワードが違います。'
      end
    end
  end

  describe 'Logout Function' do
    context 'push logout button after login' do
      it 'complete logout and redirect root-page' do
        login(user)
        find('#nav-open').click
        click_link 'ログアウト', href: destroy_user_session_path
        expect(current_path).to eq root_path
        expect(page).to have_content 'ログアウトしました。'
      end
    end
  end

  describe 'Guest Login Function' do
    context 'push guest-login button' do
      it 'complete login and redirect post-user-page' do
        visit new_user_session_path
        find('.login-section__guest').click
        expect(page).to have_content 'ゲストユーザー'
      end
    end
  end
end

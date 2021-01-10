require 'rails_helper'

RSpec.describe 'Users', type: :system do
  let!(:user) { create(:user, name: 'Alice', profile: 'photographer in LA') }

  describe 'User View' do
    context 'when user is logged in' do
      it 'display items' do
        login(user)
        expect(page).to have_selector '.header-post'
        expect(page).to have_selector '.header-icon'
        find('#nav-open').click
        expect(page).to have_link 'ホーム', href: root_path
        expect(page).to have_link 'プロフィール', href: user_path(user)
        expect(page).to have_link 'アカウント情報更新', href: edit_user_registration_path
        expect(page).to have_link 'ログアウト', href: destroy_user_session_path
      end
    end

    context 'when user is not logged in' do
      it 'display items' do
        visit root_path
        expect(page).to have_selector '.header-login__item', text: 'ログイン'
        find('#nav-open').click
        expect(page).to have_link 'ホーム', href: root_path
        expect(page).to have_link 'ログイン', href: new_user_session_path
        expect(page).to have_link '新規登録', href: new_user_registration_path
      end
    end
  end

  describe 'User Post View' do
    context 'when user is logged in' do
      it 'display items' do
        login(user)
        expect(page).to have_content 'Alice'
        expect(page).to have_content 'Bookmarks'
        expect(page).to have_content '変更'
      end
    end

    context 'when user is not logged in' do
      it 'display items' do
        visit user_path(user)
        expect(page).to have_content 'Alice'
        expect(page).to_not have_content 'Bookmarks'
        expect(page).to_not have_content '変更'
      end
    end
  end

  describe 'User Profile View' do
    it 'display items' do
      login(user)
      find('#profile-info-edit').click
      expect(page).to have_selector '#icon-preview'
      expect(find('#user_name').value).to eq 'Alice'
      expect(find('#user_profile').value).to eq 'photographer in LA'
    end
  end

  describe 'User Profile Function' do
    context 'when input valid content' do
      it 'complete edit profile' do
        login(user)
        find('#profile-info-edit').click
        fill_in '名前', with: 'Avril'
        fill_in '自己紹介', with: 'カナダ・オンタリオ州ベルビルの出身のシンガーソングライター。アメリカ合衆国に拠点を置いている。'
        click_button 'Share'
        expect(page).to have_content 'プロフィールを更新しました。'
        expect(page).to have_content 'Avril'
        expect(page).to have_content 'カナダ・オンタリオ州ベルビルの出身のシンガーソングライター。アメリカ合衆国に拠点を置いている。'
      end
    end
  end

end

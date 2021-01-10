require 'rails_helper'

RSpec.describe 'Registrations', type: :system do
  let!(:user) { create(:user, name: 'Alice', email: 'alice@example.com', password: '00000000') }

  describe 'Registration Function' do
    context 'when input valid contents' do
      it 'complete registration' do
        visit new_user_registration_path
        fill_in 'user_name', with: 'Taylor'
        fill_in 'user_email', with: 'taylor@example.com'
        fill_in 'user_password', with: 'txyylzoxry'
        fill_in 'user_password_confirmation', with: 'txyylzoxry'
        click_button '登録'
        expect(page).to have_content 'アカウント登録が完了しました。'
      end
    end

    context 'when input invalid contents' do
      it 'fail registration and display error-item' do
        visit new_user_registration_path
        fill_in 'user_name', with: 'Taylor'
        fill_in 'user_email', with: 'taylor@example.com'
        fill_in 'user_password', with: 'txyylzoxry'
        fill_in 'user_password_confirmation', with: 'xyz'
        click_button '登録'
        expect(page).to have_content '確認用パスワードとパスワードの入力が一致しません'
      end
    end
  end
end

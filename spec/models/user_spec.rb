require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { build(:user) }

  describe 'attribute: name' do
    context 'when nil, blank, empty' do
      # nameが空白、空、存在しない場合は、無効であること
      it 'is invalid' do
        user.name = ''
        expect(user).to be_invalid
        expect(user.errors[:name]).to include("を入力してください")
        user.name = ' '
        expect(user).to be_invalid
        expect(user.errors[:name]).to include("を入力してください")
        user.name = nil
        expect(user).to be_invalid
        expect(user.errors[:name]).to include("を入力してください")
      end
    end
  end

  describe 'attribute: email' do
    context 'when nil, blank, empty' do
      # emailが空白、空、存在しない場合は、無効であること
      it 'is invalid' do
        user.email = ''
        expect(user).to be_invalid
        expect(user.errors[:email]).to include("を入力してください")
        user.email = ' '
        expect(user).to be_invalid
        expect(user.errors[:email]).to include("を入力してください")
        user.email = nil
        expect(user).to be_invalid
        expect(user.errors[:email]).to include("を入力してください")
      end
    end

    context 'when domain is blank' do
      # emailにドメインが空である場合は、無効であること
      it 'is invalid' do
        user.email = "samplecom"
        expect(user).to be_invalid
        expect(user.errors[:email]).to include("は不正な値です")
      end
    end

    context 'when duplicate' do
      # emailが重複している場合は、無効であること
      it 'is invalid' do
        user = create(:user)
        another_user = build(:user, email: user.email)
        expect(another_user).to be_invalid
        expect(another_user.errors[:email]).to include("はすでに存在します")
      end
    end
  end

  describe 'attribute: password' do
    context 'when less than 6' do
      # passwordが5文字以下である場合は、無効であること
      it 'is invalid' do
        user.password = "a" * 5
        user.password_confirmation = "b" * 5
        expect(user).to be_invalid
        expect(user.errors[:password]).to include("は6文字以上で入力してください")
      end
    end
  end

  describe 'attribute: password_confirmation' do
    context 'when empty' do
      # password_confirmationが空,空白の場合は、無効であること
      it 'is invalid' do
        user.password_confirmation = ''
        expect(user).to be_invalid
        expect(user.errors[:password_confirmation]).to include("とパスワードの入力が一致しません")
        user.password_confirmation = ' '
        expect(user).to be_invalid
        expect(user.errors[:password_confirmation]).to include("とパスワードの入力が一致しません")
      end
    end

    context 'when not equal password' do
      # password_confirmationがpasswordと異なる場合は、無効であること
      it 'is invalid' do
        user.password = "a" * 6
        user.password_confirmation = "b" * 6
        expect(user).to be_invalid
        expect(user.errors[:password_confirmation]).to include("とパスワードの入力が一致しません")
      end
    end
  end

  describe 'attribute: profile' do
    context 'when less than 161' do
      # profileが161文字以上である場合は、無効であること
      it 'is invalid' do
        user.profile = "a" * 161
        expect(user).to be_invalid
        expect(user.errors[:profile]).to include("は160文字以内で入力してください")
      end
    end

    context 'when nil' do
      # profileが存在しない場合は、無効であること
      it 'is valid' do
        user.profile = nil
        expect(user).to be_valid
      end
    end
  end

  describe 'attribute: icon' do
    context 'when create user' do
      # userが新規作成された場合、iconに自動的にデフォルトイメージがセットされること
      it 'set default image automatically' do
        create(:user)
        expect(user.icon.nil?).to be false
      end
    end
  end

end

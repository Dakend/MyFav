require 'rails_helper'

RSpec.describe Tag, type: :model do
  let(:tag) { build_stubbed(:tag) }

  describe 'attribute: name' do
    context 'when nil, blank, empty' do
      #  nameが空白、空、存在しない場合は、無効であること
      it 'is invalid' do
        tag.name = ''
        expect(tag).to be_invalid
        expect(tag.errors[:name]).to include("を入力してください")
        tag.name = ' '
        expect(tag).to be_invalid
        expect(tag.errors[:name]).to include("を入力してください")
        tag.name = nil
        expect(tag).to be_invalid
        expect(tag.errors[:name]).to include("を入力してください")
      end
    end

    context 'when more than 100' do
      #  nameが100文字以上の場合は、無効であること
      it 'is invalid' do
        tag.name = 'a' * 100
        expect(tag).to be_invalid
        expect(tag.errors[:name]).to include("は99文字以内で入力してください")
      end
    end
  end
end

# == Schema Information
#
# Table name: categories
#
#  id         :bigint           not null, primary key
#  name       :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe Category, type: :model do
  let(:category) { build(:category) }

  describe 'attribute: name' do
    context 'when nil' do
      # nameが存在しない場合は、無効であること
      it 'is invalid' do
        category.name = nil
        expect(category).to be_invalid
        expect(category.errors[:name]).to include("を入力してください")
      end
    end
  end
end

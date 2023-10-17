require 'rails_helper'

RSpec.describe Profile, type: :model do
  let!(:user) { create(:user) }
  let!(:profile) { create(:profile, user: user) }

  context 'name,bioが入力されている場合' do
    it 'プロフィールを保存できる' do
      expect(profile).to be_valid
    end
  end

  context 'nameが31文字以上の場合' do
    before do
      profile.name = Faker::Lorem.characters(number: 40)
      profile.save
    end
    it 'プロフィールを保存できない' do
      expect(profile.errors.full_messages).to eq(['名前は30文字以内で入力してください'])
    end
  end

  context 'bioが151文字以上の場合' do
    before do
      profile.bio = Faker::Lorem.characters(number: 200)
      profile.save
    end
    it 'プロフィールを保存できない' do
      expect(profile.errors.full_messages).to eq(['自己紹介は150文字以内で入力してください'])
    end
  end
end

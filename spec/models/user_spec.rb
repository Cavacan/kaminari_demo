require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'create' do
    let(:user) { FactoryBot.build(:user) }

    context 'with valid attributes' do
      it 'is valid with a name and email' do
        user.email = 'testaro@expampl.com'
        expect(user).to be_valid
      end
    end

    context 'with invalid attributes' do
      it 'is invalid with a duplicate email' do
        user.save
        user2 = FactoryBot.build(:user)
        expect(user2).to be_invalid
        expect(user2.errors[:email]).to include('はすでに存在します')
      end

      it 'is invalid without a name' do
        user.name = nil
        expect(user).to be_invalid
      end

      it 'is invalid without a email' do
        user.email = nil
        expect(user).to be_invalid
      end

      it 'is invalid short password' do
        user.password = 'ab'
        user.password_confirmation = 'ab'
        expect(user).to be_invalid
      end
    end
  end
end

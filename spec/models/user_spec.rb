require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

    context '新規登録がうまくいく時' do
      it '全ての項目が存在すれば登録できる' do
        expect(@user).to be_valid
      end

      it 'passwordが6文字以上であれば登録できる' do
        @user.password = 'aaaaaa'
        @user.password_confirmation = 'aaaaaa'
        @user.valid?
      end
    end

    context '新規登録がうまくいかない時' do
      it 'nicknameが空では登録できない' do
        @user.nickname = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it 'emailが空では登録できない' do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it 'passwordが空では登録できない' do
        @user.password = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'last_nameが空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end

      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end

      it 'last_name_rubyが空では登録できない' do
        @user.last_name_ruby = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name ruby can't be blank")
      end

      it 'first_name_rubyが空では登録できない' do
        @user.first_name_ruby = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name ruby can't be blank")
      end

      it '生年月日が空では登録できない' do
        @user.birthday = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end

      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end

      it 'emailに@がない場合は登録できない' do
        @user.email = 'aaa.com'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end

      it 'passwordが5文字以下であれば登録できない' do
        @user.password = 'aaaaa'
        @user.password_confirmation = 'aaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end

      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = 'aaaaaa'
        @user.password_confirmation = 'bbbbbb'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'last_nameが全角入力でなければ登録できない' do
        @user.last_name = 'aaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name Full-width characters')
      end

      it 'first_nameが全角入力でなければ登録できない' do
        @user.first_name = 'aaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name Full-width characters')
      end

      it 'last_name_rybyが全角カタカナでなければ登録できない' do
        @user.last_name_ruby = 'あああああ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name ruby Full-width katakana characters')
      end

      it 'first_name_rubyが全角カタカナでなければ登録できない' do
        @user.first_name_ruby = 'あああああ'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name ruby Full-width katakana characters')
      end
    end
  end
end

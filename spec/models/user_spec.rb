require 'rails_helper'
describe User do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it 'name/email/password/passwsord_confrimation/first_name/last_name/first_name_phonetic/last_name_phonetic/birthdayが存在する' do
        expect(@user).to be_valid
      end
      it 'passwordが6文字以上' do
        @user.password = 'aaa000'
        @user.password_confirmation = 'aaa000'
        expect(@user).to be_valid
      end
      it 'passwordが半角英数字混合' do
        @user.password = 'aaa000'
        @user.password_confirmation = 'aaa000'
        expect(@user).to be_valid
      end
      it 'first_nameが全角であること' do
        @user.first_name = '太郎'
        expect(@user).to be_valid
      end
      it 'last_nameが全角であること' do
        @user.first_name = '加藤'
        expect(@user).to be_valid
      end
      it 'first_name_phoneticが全角カタカナ' do
        @user.first_name = 'タロウ'
        expect(@user).to be_valid
      end
      it 'last_name_phoneticが全角カタカナ' do
        @user.first_name = 'カトウ'
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it 'nameが空' do
        @user.name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Name can't be blank")
      end
      it 'emailが空' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'emailに@がない' do
        @user.email = 'aaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'emailが重複している' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'passwordが空' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが5文字以下' do
        @user.password = '00000'
        @user.password_confirmation = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordが半角英字ではない' do
        @user.password = 'password'
        @user.password_confirmation = 'password'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it 'passwordが半角数字ではない' do
        @user.password = '000000'
        @user.password_confirmation = '000000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it 'passwordがあってもpasswsord_confrimationが空' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'first_nameが空' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it 'first_nameが全角ではない' do
        @user.first_name = 'aaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name is invalid')
      end
      it 'last_nameが空' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it 'last_nameが全角ではない' do
        @user.last_name = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name is invalid')
      end
      it 'first_name_phoneticが空' do
        @user.first_name_phonetic = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name phonetic can't be blank")
      end
      it 'first_name_phoneticが全角カタカナではない' do
        @user.first_name_phonetic = 'aaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name phonetic is invalid')
      end
      it 'last_name_phoneticが空' do
        @user.last_name_phonetic = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name phonetic can't be blank")
      end
      it 'last_name_phoneticが全角カタカナではない' do
        @user.last_name_phonetic = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name phonetic is invalid')
      end
      it 'birthdayが空' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end

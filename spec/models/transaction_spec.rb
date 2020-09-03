require 'rails_helper'
describe Transaction do
  before do
   @transaction = FactoryBot.build(:transaction)
  end

  describe '商品購入機能' do
    context '商品購入がうまくいくとき' do
      it "郵便番号・都道府県・市区町村番地・電話番号が存在する" do
        expect(@transaction).to be_valid
      end
      it "郵便番号にはハイフンが必要" do
        @transaction.post_number = "000-0000"
        expect(@transaction).to be_valid
      end
      it "電話番号にはハイフンは不要で、11桁以内" do
        @transaction.phone_number = "00000000000"
        expect(@transaction).to be_valid
      end
    end

    context '商品購入がうまくいかないとき' do
      it 'post_numberが空' do
        @transaction.post_number = ''
        @transaction.valid?
        expect(@transaction.errors.full_messages).to include("Post number can't be blank")
      end
      it 'post_numberにハイフンがない' do
        @transaction.post_number = '0000000'
        @transaction.valid?
        expect(@transaction.errors.full_messages).to include("Post number is invalid")
      end
      it 'buyer_prefecture_idが空' do
        @transaction.buyer_prefecture_id = ''
        @transaction.valid?
        expect(@transaction.errors.full_messages).to include("Buyer prefecture can't be blank", "Buyer prefecture is not a number")
      end
      it 'buyer_prefecture_idが1のとき' do
        @transaction.buyer_prefecture_id = '1'
        @transaction.valid?
        expect(@transaction.errors.full_messages).to include("Buyer prefecture must be other than 1")
      end
      it 'cityが空' do
        @transaction.city = ''
        @transaction.valid?
        expect(@transaction.errors.full_messages).to include("City can't be blank")
      end
      it 'addressが空' do
        @transaction.address = ''
        @transaction.valid?
        expect(@transaction.errors.full_messages).to include("Address can't be blank")
      end
      it 'phone_numberが空' do
        @transaction.phone_number = ''
        @transaction.valid?
        expect(@transaction.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberにハイフンが入っている' do
        @transaction.phone_number = '000-0000-0000'
        @transaction.valid?
        expect(@transaction.errors.full_messages).to include("Phone number is invalid")
      end
    end
  end
end

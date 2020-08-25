require 'rails_helper'
describe Item do
  before do
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload('public/images/test_image.png')
  end

  describe '商品出品機能' do
    context '出品がうまくいくとき' do
      it 'image,name,text,cotegory_id,price,condition_id,postage_id,exhibitor_prefecture_id,days_id存在する' do
        expect(@item).to be_valid
      end
    end

    context '出品がうまくいかないとき' do
      it 'imageが空' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'nameが空' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'category_idが空' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank", "Category is not a number")
      end
      it 'priceが空' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'condition_idが空' do
        @item.condition_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank", "Condition is not a number")
      end
      it 'postage_idが空' do
        @item.postage_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Postage can't be blank", "Postage is not a number")
      end
      it 'exhibitor_prefecture_idが空' do
        @item.exhibitor_prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Exhibitor prefecture can't be blank", "Exhibitor prefecture is not a number")
      end
      it 'days_idが空' do
        @item.days_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Days can't be blank", "Days is not a number")
      end
      it 'ユーザーが紐付いていない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end
    end
  end
end
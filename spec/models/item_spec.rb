require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '#create' do
    context '内容に問題ない場合' do
      it 'itemとimageが存在していれば保存できること' do
        expect(@item).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'ユーザーが紐付いていなければ投稿できないこと' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end

      it '商品画像を1枚つけなければ出品できないこと' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it '商品名が空では出品できないこと' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it '商品説明が空では出品できないこと' do
        @item.info = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Info can't be blank")
      end

      it 'カテゴリーが空では出品できないこと' do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it '商品の状態が空では出品できないこと' do
        @item.sales_status_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Sales status can't be blank")
      end

      it '配送料の負担が空では出品できないこと' do
        @item.item_shipping_fee_status_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Item shipping fee status can't be blank")
      end

      it '発送元の地域が空では出品できないこと' do
        @item.prefecture_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end

      it '発送までの日数が空では出品できないこと' do
        @item.item_scheduled_delivery_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Item scheduled delivery can't be blank")
      end

      it '価格が空では出品できないこと' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it '価格が半角数値でない場合は、出品できないこと' do
        @item.price = '１０００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end

      it '価格が300以下の場合は保存できないこと' do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
      end

      it '価格が9,999,999以上の場合は保存できないこと' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
      end
    end
  end
end

require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '出品がうまくいくとき' do
      it '全項目が存在すれば出品できる' do
        expect(@item).to be_valid
      end
    end

    context '出品がうまくいかないとき' do
      it 'nameが空だと出品できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'descriptionが空では出品できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it 'category_idが空だと出品できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it 'condition_idが空だと出品できない' do
        @item.condition_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end
      it 'delivery_charge_idが空だと出品できない' do
        @item.delivery_charge_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery charge can't be blank")
      end
      it 'prefecture_idが空だと出品できない' do
        @item.prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'delivery_day_idが空だと出品できない' do
        @item.delivery_day_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery day can't be blank")
      end
      it 'imageが空だと出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'priceが空だと出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceが半角英数字でないと登録できない' do
        @item.price = 'あ亜アaaa'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not included in the list')
      end
      it 'priceが300以下であれば出品できない' do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not included in the list')
      end
      it 'priceが9_999_999以上であれば出品できない' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not included in the list')
      end
      it 'category_idのIDが0だと出品できない' do
        @item.category_id = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include('Category must be other than 0')
      end
      it 'condition_idのIDが0だと出品できない' do
        @item.condition_id = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include('Condition must be other than 0')
      end
      it 'delivery_charge_idのIDが0だと出品できない' do
        @item.delivery_charge_id = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include('Delivery charge must be other than 0')
      end
      it 'prefecture_idのIDが0だと出品できない' do
        @item.prefecture_id = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include('Prefecture must be other than 0')
      end
      it 'delivery_day_idのIDが0だと出品できない' do
        @item.delivery_day_id = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include('Delivery day must be other than 0')
      end
    end
  end
end

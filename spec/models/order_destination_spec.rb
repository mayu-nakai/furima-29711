require 'rails_helper'

RSpec.describe OrderDestination, type: :model do
  describe '商品購入機能' do
    before do
      buyer = FactoryBot.build(:user)
      item2 = FactoryBot.build(:item)
      @order_destination = FactoryBot.build(:order_destination, user_id: buyer.id, item_id: item2.id)
    end

    it 'すべての値が正しく入力されていれば購入できること' do
      expect(@order_destination).to be_valid
    end
    it 'tokenが空だと購入できないこと' do
      @order_destination.token = nil
      @order_destination.valid?
      expect(@order_destination.errors.full_messages).to include("Token can't be blank")
    end
    it 'post_codeが空だと購入できないこと' do
      @order_destination.post_code = nil
      @order_destination.valid?
      expect(@order_destination.errors.full_messages).to include("Post code can't be blank")
    end
    it 'prefecture_idが空だと購入できないこと' do
      @order_destination.prefecture_id = 0
      @order_destination.valid?
      expect(@order_destination.errors.full_messages).to include('Prefecture must be other than 0')
    end
    it 'cityが空だと購入できないこと' do
      @order_destination.city = nil
      @order_destination.valid?
      expect(@order_destination.errors.full_messages).to include("City can't be blank")
    end
    it 'house_numberが空だと購入できないこと' do
      @order_destination.house_number = nil
      @order_destination.valid?
      expect(@order_destination.errors.full_messages).to include("House number can't be blank")
    end
    it 'phone_numberが空だと購入できないこと' do
      @order_destination.phone_number = nil
      @order_destination.valid?
      expect(@order_destination.errors.full_messages).to include("Phone number can't be blank")
    end
    it 'user_idが空だと購入できないこと' do
      @order_destination.user_id = nil
      @order_destination.valid?
      expect(@order_destination.errors.full_messages).to include("User can't be blank")
    end
    it 'item_idが空だと購入できないこと' do
      @order_destination.item_id = nil
      @order_destination.valid?
      expect(@order_destination.errors.full_messages).to include("Item can't be blank")
    end
    it 'post_codeが半角のハイフンを含まないと購入できないこと' do
      @order_destination.post_code = '1234567'
      @order_destination.valid?
      expect(@order_destination.errors.full_messages).to include('Post code is invalid')
    end
    it 'phone_numberにはハイフンは不要で、11桁以内でないと購入できないこと' do
      @order_destination.phone_number = '1111111111'
      @order_destination.valid?
      expect(@order_destination.errors.full_messages).to include('Phone number is invalid')
    end
    it 'phone_numberにハイフンが含まれていると購入できないこと' do
      @order_destination.phone_number = '111-1111-11'
      @order_destination.valid?
      expect(@order_destination.errors.full_messages).to include('Phone number is invalid')
    end
  end
end

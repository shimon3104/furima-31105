require 'rails_helper'

RSpec.describe OrderReceive, type: :model do
  describe '#create' do
    before do
      @order_receive = FactoryBot.build(:order_receive)
    end

    context '商品購入がうまくいく時' do
      it '全ての項目が存在すれば購入できる' do
        expect(@order_receive).to be_valid
      end

      it 'building_nameが空でも購入できる' do
        @order_receive.building_name = nil
        expect(@order_receive).to be_valid
      end
    end

    context '商品購入がうまくいかない時' do
      it 'tokenが空では購入できない' do
        @order_receive.token = nil
        @order_receive.valid?
        expect(@order_receive.errors.full_messages).to include("Token can't be blank")
      end
      
      it 'postal_codeが空では購入できない' do
        @order_receive.postal_code = nil
        @order_receive.valid?
        expect(@order_receive.errors.full_messages).to include("Postal code can't be blank")
      end

      it 'prefecture_idが0では購入できない' do
        @order_receive.prefecture_id = 0
        @order_receive.valid?
        expect(@order_receive.errors.full_messages).to include("Prefecture Select")
      end

      it 'city_nameが空では購入できない' do
        @order_receive.city_name = nil
        @order_receive.valid?
        expect(@order_receive.errors.full_messages).to include("City name can't be blank")
      end

      it 'addressが空では購入できない' do
        @order_receive.address = nil
        @order_receive.valid?
        expect(@order_receive.errors.full_messages).to include("Address can't be blank")
      end

      it 'phone_numberが空では購入できない' do
        @order_receive.phone_number = nil
        @order_receive.valid?
        expect(@order_receive.errors.full_messages).to include("Phone number can't be blank")
      end

      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと購入できない' do
        @order_receive.postal_code = '1234567'
        @order_receive.valid?
        expect(@order_receive.errors.full_messages).to include("Postal code Input correctly")
      end

      it 'phone_numberが半角数字以外だと購入できない' do
        @order_receive.phone_number = '０９０１２３４５６７８'
        @order_receive.valid?
        expect(@order_receive.errors.full_messages).to include("Phone number Input only number")
      end

    end
  end
end

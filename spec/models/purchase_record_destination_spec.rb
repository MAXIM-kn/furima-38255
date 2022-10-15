require 'rails_helper'

RSpec.describe PurchaseRecordDestination, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @purchase_record_destination = FactoryBot.build(:purchase_record_destination, user_id: user.id, item_id: item.id)
    sleep 0.1
  end

  describe '配送先情報の保存' do
    context '配送先情報が保存できるとき' do
      it '必須入力の値がすべて正しく入力されていれば保存できる' do
        expect(@purchase_record_destination).to be_valid
      end

      it 'user_idがあれば保存できる' do
        @purchase_record_destination.user_id = 1
        expect(@purchase_record_destination).to be_valid
      end

      it 'item_idがあれば保存できる' do
        @purchase_record_destination.item_id = 1
        expect(@purchase_record_destination).to be_valid
      end

      it 'building_nameは空でも保存できる' do
        @purchase_record_destination.building_name = ''
        expect(@purchase_record_destination).to be_valid
      end

    end
    context '配送先情報が保存できない場合' do
      it 'post_codeが空では保存できない' do
        @purchase_record_destination.post_code = ''
        @purchase_record_destination.valid?
        expect(@purchase_record_destination.errors.full_messages).to include "Post code can't be blank"
      end
      it 'post_codeは3桁ハイフン4桁の半角数値でしか保存ができない' do
        @purchase_record_destination.post_code = '１２３-４５６７'
        @purchase_record_destination.valid?
        expect(@purchase_record_destination.errors.full_messages).to include "Post code is invalid"
      end
      it 'shipping_area_idが(---)では保存できない' do
        @purchase_record_destination.shipping_area_id = 1
        @purchase_record_destination.valid?
        expect(@purchase_record_destination.errors.full_messages).to include "Shipping area can't be blank"
      end
      it 'municipalityが空では保存できない' do
        @purchase_record_destination.municipality = ''
        @purchase_record_destination.valid?
        expect(@purchase_record_destination.errors.full_messages).to include "Municipality can't be blank"
      end
      it 'addressが空では保存できない' do
        @purchase_record_destination.address = ''
        @purchase_record_destination.valid?
        expect(@purchase_record_destination.errors.full_messages).to include "Address can't be blank"
      end
      it 'phone_numberが空では保存できない' do
        @purchase_record_destination.phone_number = ''
        @purchase_record_destination.valid?
        expect(@purchase_record_destination.errors.full_messages).to include "Phone number can't be blank"
      end
      it 'phone_numberは10桁以上11桁以内の半角数値のみでしか保存できない' do
        @purchase_record_destination.phone_number = '１２３４５-６７８９０'
        @purchase_record_destination.valid?
        expect(@purchase_record_destination.errors.full_messages).to include "Phone number is invalid"
      end
      it 'user_idが紐付いていなければ購入ができない' do
        @purchase_record_destination.user_id = nil
        @purchase_record_destination.valid?
        expect(@purchase_record_destination.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが紐付いていなければ購入ができない' do
        @purchase_record_destination.item_id = nil
        @purchase_record_destination.valid?
        expect(@purchase_record_destination.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end

class PurchaseRecordDestination
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code, :shipping_area_id, :municipality, :address, :building_name, :phone_number, :token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/ }
    validates :shipping_area_id
    validates :municipality
    validates :address
    validates :phone_number, format: { with: /\A\d{10,11}\z/ }
    validates :token
  end
  validates :shipping_area_id, numericality: { other_than: 1, message: "can't be blank" }

  def save
    purchase_record = PurchaseRecord.create(user_id: user_id, item_id: item_id)
    Destination.create(post_code: post_code, shipping_area_id: shipping_area_id, municipality: municipality, address: address, building_name: building_name, phone_number: phone_number, purchase_record_id: purchase_record.id)
  end
  
end
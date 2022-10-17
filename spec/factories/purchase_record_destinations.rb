FactoryBot.define do
  factory :purchase_record_destination do
      post_code         { '123-4567' }
      shipping_area_id  { Faker::Number.between(from: 2, to: 48) }
      municipality      { '〇〇市' }
      address           { '〇〇番地' }
      building_name     { '〇〇マンション' }
      phone_number      { '12345678901'  }
      token             { 'tok_abcdefghijk00000000000000000' }
  end
end

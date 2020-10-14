FactoryBot.define do
  factory :order_destination do
    token           {'test'}
    post_code       {'123-4567' }
    prefecture_id   { 1 }
    city            { '奈良市' }
    house_number    { '新川' }
    phone_number    { '09012345678' }
    
    association :user
    association :item
  end
end
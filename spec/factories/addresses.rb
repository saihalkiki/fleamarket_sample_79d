FactoryBot.define do
  factory :address do

    postal_code       {"000-0000"}
    prefecture_id     {"1"}
    city              {"渋谷区"}
    house_number      {"1-1"}
    building_name     {"渋谷マンション"}
    phone_number      {"08012345678"}
    user_id           {"1"}
  end
end

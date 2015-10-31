FactoryGirl.define do
  factory :listing do
    uuid { Faker::Bitcoin.address }
    active true
    name { Faker::Name.name }
    email { Faker::Email.email }
    description { Faker::Lorem.sentence }
    address { Faker::Address.street_address }
    city { Faker::Address.city }
    state { Faker::Address.state_abbr }
    zipcode { Faker::Address.zip }
    lat { Faker::Address.latitude }
    lng { Faker::Address.longitude }
    phone_number { Faker::PhoneNumber.phone_number }
  end

end

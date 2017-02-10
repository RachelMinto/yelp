Fabricator(:business) do
  company_name { Faker::Company.name }
  address { Faker::Address.street_address }
  city { Faker::Address.city }
  state { Faker::Address.state }
  zipcode { Faker::Address.zip_code }
  phone { Faker::PhoneNumber.phone_number }
end
Fabricator(:business) do
  company_name { Faker::Company.name }
  address { Faker::Address.street_address }
  city { Faker::Address.city }
  state { Faker::Address.state }
  zipcode { ["07234", "55342", "44321"].sample }
  phone { Faker::PhoneNumber.phone_number }
end
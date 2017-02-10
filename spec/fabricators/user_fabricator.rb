Fabricator(:user) do
  first_name { Faker::Name.first_name }
  last_name { Faker::Name.last_name }
  email { Faker::Internet.email }
  password { Faker::Internet.password }
  location { Faker::Address.city + ', ' + Faker::Address.state_abbr }    
end
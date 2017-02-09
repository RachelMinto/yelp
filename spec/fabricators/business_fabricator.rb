Fabricator(:business) do
  company_name { Faker::Lorem.words(3) }
end
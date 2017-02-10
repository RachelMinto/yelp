Fabricator(:review) do
  rating { [1, 2, 3, 4, 5].sample }
  comment { Faker::Lorem.paragraph }
end
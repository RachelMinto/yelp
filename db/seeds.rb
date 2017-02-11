# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Business.create(company_name: 'The Green Briar', address: '445 Washington St.', city: 'Brighton', state: 'MA', zipcode: '02135', phone: '4445434120', 
  bike_parking: true, credit_cards: true, wheel_chair: false, 
  mon_start: '12:00 PM', mon_end: '10:00 PM', tue_start: '12:00 PM', tue_end: '10:00 PM', 
  wed_start: '12:00 PM', wed_end: '12:00 PM', thu_start: '12:00 PM', thu_end: '8:00 PM', 
  fri_start: '12:00 PM', fri_end: '2:00 AM', sat_start: '10:00 AM', sat_end: '12:00 AM',
  sun_start: '12:00 PM', sun_end: '12:00 AM')

Business.create(company_name: 'Filirino\'s', address: '45 Beacon St.', 
  city: 'Boston', state: 'MA', zipcode: '02215', phone: '4545934100', 
  bike_parking: true, credit_cards: true, wheel_chair: false, 
  tue_start: '12:00 PM', tue_end: '10:00 PM', 
  wed_start: '12:00 PM', wed_end: '12:00 PM', thu_start: '12:00 PM', thu_end: '8:00 PM', 
  fri_start: '12:00 PM', fri_end: '2:00 AM', sat_start: '10:00 AM', sat_end: '12:00 AM',
  sun_start: '12:00 PM', sun_end: '12:00 AM')

Business.create(company_name: 'Perry\'s Ice Cream Shoppe', address: '422 Merry Lane', 
  city: 'Madison', state: 'WI', zipcode: '03424', phone: '9044434500', 
  bike_parking: true, credit_cards: false, wheel_chair: false, 
  mon_start: '12:00 PM', mon_end: '10:00 PM', tue_start: '12:00 PM', tue_end: '10:00 PM', 
  wed_start: '12:00 PM', wed_end: '12:00 PM', thu_start: '12:00 PM', thu_end: '8:00 PM', 
  fri_start: '12:00 PM', fri_end: '2:00 AM', sat_start: '10:00 AM', sat_end: '12:00 AM',
  sun_start: '12:00 PM', sun_end: '12:00 AM')

business1 = Fabricate(:business)
business2 = Fabricate(:business)

Fabricate(:user, profile_picture: "/images/profile_1.jpg")
Fabricate(:user, profile_picture: "/images/profile_1.jpg")
Fabricate(:user, profile_picture: "/images/profile_1.jpg")
Fabricate(:user, profile_picture: "/images/profile_1.jpg")

alice = Fabricate(:user)
Fabricate(:review, user_id: alice.id, business_id: business1.id)
Fabricate(:review, user_id: alice.id, business_id: Business.first.id)

bob = Fabricate(:user)
Fabricate(:review, business_id: business1.id, user_id: bob.id)
Fabricate(:review, business_id: business2.id, user_id: bob.id)
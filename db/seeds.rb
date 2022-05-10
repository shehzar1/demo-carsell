# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Ad.create(city: 'Lahore', milage: '10', car_make: 'Honda', price: '2000000', engine_type: 'Petrol',
  transmission_type: 'Manual', engine_capacity: '1300', color: 'Black', assembly_type: 'Local', description: 'Bumper to Bumper genuine')

Ad.create(city: 'Karachi', milage: '11', car_make: 'Honda', price: '2000000', engine_type: 'Petrol',
  transmission_type: 'Manual', engine_capacity: '1300', color: 'Black', assembly_type: 'Local', description: 'Bumper to Bumper genuine')

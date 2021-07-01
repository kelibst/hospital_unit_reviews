# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Hospital.create(name: "Kekeli Hospital", start_date: "20-03-1991", country: "Ghana", region: "Volta", address: "Ho Housing")
Administrator.create(name: "keli Booster", role: "Head of IT", email: "kbooster17@gmail.com", phone: "+233546249862", password: "password@123", hospital_id: 1)
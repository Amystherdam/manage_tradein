# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

admin_user = User.create(email: "admin@tradein.com", password: "123456")
UserProfile.create(name: "Admin", phone: "85988887777", gender: "O", role: "admin", user: admin_user)
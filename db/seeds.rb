# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

AdminUser.create!(first_name: 'sara', last_name: 'mae', access_type: 'Admin', email: "sarahmae@gmail.com", password: 'SaraMae12!', password_confirmation: 'SaraMae12!', terms_of_service: true )


# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


AdminUser.create!(first_name: 'john', last_name: 'smith', access_type: 'Admin', email: "johnsmith@gmail.com", password: 'JohnSmith12!', password_confirmation: 'JohnSmith12!', terms_of_service: true )

User.create!(first_name: 'sarah', last_name: 'smith', access_type: 'Customer', email: "janedoe@gmail.com", password: 'JaneDoe12!', password_confirmation: 'JaneDoe12!', terms_of_service: true )

image1 = Item.create!(name: 'Green Polo', size: 'M', category: "Top", sub_category: "polos", quantity: 20, price: 50, description: 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Optio ea laudantium voluptatum vel harum ad quia esse aspernatur nobis. Quod distinctio velit cum voluptas quaerat corporis recusandae quisquam consequuntur aliquam!')
image1.featured_image.attach( io: File.open(Rails.root.join("./assets/images/image1.png")), filename: 'image1.png')

image2 = Item.create!(name: 'Green Shirt', size: 'M', category: "Top", sub_category: "tshirts", quantity: 20, price: 10, description: 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Optio ea laudantium voluptatum vel harum ad quia esse aspernatur nobis. Quod distinctio velit cum voluptas quaerat corporis recusandae quisquam consequuntur aliquam!')
image2.featured_image.attach( io: File.open(Rails.root.join("./assets/images/image2.png")), filename: 'image2.png')

image3 = Item.create!(name: 'Black Sweater', size: 'S', category: "Top", sub_category: "sweaters", quantity: 20, price: 50, description: 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Optio ea laudantium voluptatum vel harum ad quia esse aspernatur nobis. Quod distinctio velit cum voluptas quaerat corporis recusandae quisquam consequuntur aliquam!')
image3.featured_image.attach( io: File.open(Rails.root.join("./assets/images/image3.png")), filename: 'image3.png')

image4 = Item.create!(name: 'Black Joggers', size: 'M', category: "Bottom", sub_category: "joggers", quantity: 20, price: 50, description: 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Optio ea laudantium voluptatum vel harum ad quia esse aspernatur nobis. Quod distinctio velit cum voluptas quaerat corporis recusandae quisquam consequuntur aliquam!')
image4.featured_image.attach( io: File.open(Rails.root.join("./assets/images/image4.png")), filename: 'image4.png')

image5 = Item.create!(name: 'Brown Khakis', size: 'L', category: "Bottom", sub_category: "chinos", quantity: 20, price: 50, description: 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Optio ea laudantium voluptatum vel harum ad quia esse aspernatur nobis. Quod distinctio velit cum voluptas quaerat corporis recusandae quisquam consequuntur aliquam!')
image5.featured_image.attach( io: File.open(Rails.root.join("./assets/images/image5.png")), filename: 'image5.png')

image6 = Item.create!(name: 'Green Joggers', size: 'M', category: "Bottom", sub_category: "joggers", quantity: 20, price: 50, description: 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Optio ea laudantium voluptatum vel harum ad quia esse aspernatur nobis. Quod distinctio velit cum voluptas quaerat corporis recusandae quisquam consequuntur aliquam!')
image6.featured_image.attach( io: File.open(Rails.root.join("./assets/images/image6.png")), filename: 'image6.png')

image7 = Item.create!(name: 'Bucket Hat', size: 'M', category: "Accessory", sub_category: "hats", quantity: 20, price: 20, description: 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Optio ea laudantium voluptatum vel harum ad quia esse aspernatur nobis. Quod distinctio velit cum voluptas quaerat corporis recusandae quisquam consequuntur aliquam!')
image7.featured_image.attach( io: File.open(Rails.root.join("./assets/images/image7.png")), filename: 'image7.png')

image8 = Item.create!(name: 'Tint Shades', size: 'M', category: "Accessory", sub_category: "shades", quantity: 20, price: 10, description: 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Optio ea laudantium voluptatum vel harum ad quia esse aspernatur nobis. Quod distinctio velit cum voluptas quaerat corporis recusandae quisquam consequuntur aliquam!')
image8.featured_image.attach( io: File.open(Rails.root.join("./assets/images/image8.png")), filename: 'image8.png')


10.times do 
    newUser = User.create!(
    first_name: Faker::Name.first_name, 
    last_name: Faker::Name.last_name, 
    access_type: 'Customer', 
    email: Faker::Name.first_name + Faker::Name.last_name + "#{rand(30)}" + "@gmail.com", 
    password: 'Password123!', 
    password_confirmation: 'Password123!', 
    terms_of_service: true )

    newUser.reviews.create!(
        rating: rand(1..5),
        comment: 'Lorem ipsum dolor sit, amet consectetur adipisicing elit. Veniam nemo at ratione! Illum officia aspernatur natus, placeat sit aperiam accusantium repellendus, assumenda facilis similique a aliquam. Modi perferendis alias laborum',
        item_id: image1.id      
    )
end

10.times do 
    newUser = User.create!(
    first_name: Faker::Name.first_name, 
    last_name: Faker::Name.last_name, 
    access_type: 'Customer', 
    email: Faker::Name.first_name + Faker::Name.last_name + "#{rand(30)}" + "@gmail.com", 
    password: 'Password123!', 
    password_confirmation: 'Password123!', 
    terms_of_service: true )

    newUser.reviews.create!(
        rating: rand(1..5),
        comment: 'Lorem ipsum dolor sit, amet consectetur adipisicing elit. Veniam nemo at ratione! Illum officia aspernatur natus, placeat sit aperiam accusantium repellendus, assumenda facilis similique a aliquam. Modi perferendis alias laborum',
        item_id: image2.id      
    )
end

10.times do 
    newUser = User.create!(
    first_name: Faker::Name.first_name, 
    last_name: Faker::Name.last_name, 
    access_type: 'Customer', 
    email: Faker::Name.first_name + Faker::Name.last_name + "#{rand(30)}" + "@gmail.com", 
    password: 'Password123!', 
    password_confirmation: 'Password123!', 
    terms_of_service: true )

    newUser.reviews.create!(
        rating: rand(1..5),
        comment: 'Lorem ipsum dolor sit, amet consectetur adipisicing elit. Veniam nemo at ratione! Illum officia aspernatur natus, placeat sit aperiam accusantium repellendus, assumenda facilis similique a aliquam. Modi perferendis alias laborum',
        item_id: image3.id      
    )
end

10.times do 
    newUser = User.create!(
    first_name: Faker::Name.first_name, 
    last_name: Faker::Name.last_name, 
    access_type: 'Customer', 
    email: Faker::Name.first_name + Faker::Name.last_name + "#{rand(30)}" + "@gmail.com", 
    password: 'Password123!', 
    password_confirmation: 'Password123!', 
    terms_of_service: true )

    newUser.reviews.create!(
        rating: rand(1..5),
        comment: 'Lorem ipsum dolor sit, amet consectetur adipisicing elit. Veniam nemo at ratione! Illum officia aspernatur natus, placeat sit aperiam accusantium repellendus, assumenda facilis similique a aliquam. Modi perferendis alias laborum',
        item_id: image4.id      
    )
end

10.times do 
    newUser = User.create!(
    first_name: Faker::Name.first_name, 
    last_name: Faker::Name.last_name, 
    access_type: 'Customer', 
    email: Faker::Name.first_name + Faker::Name.last_name + "#{rand(30)}" + "@gmail.com", 
    password: 'Password123!', 
    password_confirmation: 'Password123!', 
    terms_of_service: true )

    newUser.reviews.create!(
        rating: rand(1..5),
        comment: 'Lorem ipsum dolor sit, amet consectetur adipisicing elit. Veniam nemo at ratione! Illum officia aspernatur natus, placeat sit aperiam accusantium repellendus, assumenda facilis similique a aliquam. Modi perferendis alias laborum',
        item_id: image5.id      
    )
end

10.times do 
    newUser = User.create!(
    first_name: Faker::Name.first_name, 
    last_name: Faker::Name.last_name, 
    access_type: 'Customer', 
    email: Faker::Name.first_name + Faker::Name.last_name + "#{rand(30)}" + "@gmail.com", 
    password: 'Password123!', 
    password_confirmation: 'Password123!', 
    terms_of_service: true )

    newUser.reviews.create!(
        rating: rand(1..5),
        comment: 'Lorem ipsum dolor sit, amet consectetur adipisicing elit. Veniam nemo at ratione! Illum officia aspernatur natus, placeat sit aperiam accusantium repellendus, assumenda facilis similique a aliquam. Modi perferendis alias laborum',
        item_id: image6.id      
    )
end

10.times do 
    newUser = User.create!(
    first_name: Faker::Name.first_name, 
    last_name: Faker::Name.last_name, 
    access_type: 'Customer', 
    email: Faker::Name.first_name + Faker::Name.last_name + "#{rand(30)}" + "@gmail.com", 
    password: 'Password123!', 
    password_confirmation: 'Password123!', 
    terms_of_service: true )

    newUser.reviews.create!(
        rating: rand(1..5),
        comment: 'Lorem ipsum dolor sit, amet consectetur adipisicing elit. Veniam nemo at ratione! Illum officia aspernatur natus, placeat sit aperiam accusantium repellendus, assumenda facilis similique a aliquam. Modi perferendis alias laborum',
        item_id: image7.id      
    )
end

10.times do 
    newUser = User.create!(
    first_name: Faker::Name.first_name, 
    last_name: Faker::Name.last_name, 
    access_type: 'Customer', 
    email: Faker::Name.first_name + Faker::Name.last_name + "#{rand(30)}" + "@gmail.com", 
    password: 'Password123!', 
    password_confirmation: 'Password123!', 
    terms_of_service: true )

    newUser.reviews.create!(
        rating: rand(1..5),
        comment: 'Lorem ipsum dolor sit, amet consectetur adipisicing elit. Veniam nemo at ratione! Illum officia aspernatur natus, placeat sit aperiam accusantium repellendus, assumenda facilis similique a aliquam. Modi perferendis alias laborum',
        item_id: image8.id      
    )
end

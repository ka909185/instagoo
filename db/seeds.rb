10.times do |n|
  email = Faker::Internet.email
  password = "password"
  name = Faker::Name.name
  User.create!(email: email,
               password: password,
               password_confirmation: password,
               name: name
               )
end
n = 7
while n <= 16
  title = Faker::Name.title
  content = Faker::Food.ingredient
  Pic.create(
    title: title,
    content: content,
    user_id: n
  )
  n = n + 1
end

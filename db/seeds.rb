# Users
User.create!(name:  "Example User",
  email: "example@railstutorial.org",
  password:              "foobar",
  password_confirmation: "foobar",
  admin:     true,
  activated: true,
  activated_at: Time.zone.now)

User.create!(name:  "Nguyen Vinh",
  email: "theten12@gmail.com",
  password:              "Theten12",
  password_confirmation: "Theten12",
  admin:     true,
  activated: true,
  activated_at: Time.zone.now)

99.times do |n|
name  = Faker::Name.name
email = "example-#{n+1}@railstutorial.org"
password = "password"
User.create!(name:  name,
    email: email,
    password:              password,
    password_confirmation: password,
    activated: true,
    activated_at: Time.zone.now)
end

# Microposts
users = User.order(:created_at).take(6)
50.times do
title = Faker::Lorem.sentence(5)
content = Faker::Lorem.paragraph(2)
users.each { |user| user.microposts.create!(title: title,content: content) }
end

# Following relationships
users = User.all
user  = users.first
following = users[2..50]
followers = users[3..40]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }
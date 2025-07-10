

# Admin
User.create!(
  email: "admin@gmail.com",
  password: "123456",
  password_confirmation: "123456",
  admin: true
) unless User.exists?(email: "admin@gmail.com")

# User
User.create!(
  email: "user@gmail.com",
  passoword: "123456",
  password_confirmation: "123456",
  user: false
) unless User.exists?(email: "user@gmail.com")

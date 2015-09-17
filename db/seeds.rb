5.times do
  User.create(email: "#{SecureRandom.hex(5)}@gmail.com", username: SecureRandom.hex(5), uid: rand(10000))
end

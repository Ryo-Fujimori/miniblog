100.times do |n|
  @user = User.create!(email: "User#{n+1}@email.com", password: "initUser#{n+1}")
  10.times do |t|
  @user.posts.create!(content: "content#{t+1}")
  end
end

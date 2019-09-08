# frozen_string_literal: true

def print_user(user)
  puts [Rainbow('Email').blue, Rainbow(user.email).green].join(' : ')
  puts [Rainbow('Password').blue, Rainbow(user.password).green].join(' : ')
  puts Rainbow('*' * 20).yellow
end

admin, *others = 10.times.map do |index|
  User.create!(
      email: Faker::Internet.email,
      password: Faker::Internet.password,
      nickname: Faker::Twitter.screen_name,
      role: index.zero? ? 'admin' : 'default',
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name

  )
end

others.each do |user|
  user.ads = 10.times.map do
    Ad.new(
        title: Faker::Book.title,
        body: Faker::Books::Lovecraft.paragraph_by_chars(characters: 1024),
        state: Ad.state.values.sample
    )
  end
end

puts 'Admin user'
print_user(admin)
puts 'Other users'
others.each(&method(:print_user))

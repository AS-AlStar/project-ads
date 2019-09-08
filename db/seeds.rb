# frozen_string_literal: true

Rails.logger = Logger.new(STDOUT)

def colorize_hash(hash)
  hash.map { |k, v| [Rainbow(k.to_s.upcase).blue, Rainbow(v).green].join(' : ') }
end

def print_user(user)
  strs = colorize_hash(email: user.email, password: user.password) + Array(Rainbow('*' * 20).yellow)
  strs.each(&Rails.logger.method(:info))
end

admin, *others = Array.new(10).map.with_index do |_, index|
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
  user.ads = Array.new(10).map do
    Ad.new(
      title: Faker::Book.title,
      body: Faker::Books::Lovecraft.paragraph_by_chars(characters: 1024),
      state: Ad.state.values.sample
    )
  end
end

Rails.logger.info 'Admin user'
print_user(admin)
Rails.logger.info 'Other users'
others.each(&method(:print_user))

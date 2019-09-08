# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
if Rails.env.development?
  User.create!(
    email: 'admin@example.com',
    password: 'password',
    password_confirmation: 'password',
    nickname: 'true_admin'
  )
end
# config.secret_key = 'c44ce72147c6ed18a24c0c968f153a9b1f5453cbb21d1f31058ee8568c6927c3701ba88212235c6a00ef7e1b'

# frozen_string_literal: true

user = User.where(email: 'fzvphoto@gmail.com').first_or_initialize
user.update!(
  password: ENV.fetch('SEEDS_PASS', nil),
  password_confirmation: ENV.fetch('SEEDS_PASS', nil)
)

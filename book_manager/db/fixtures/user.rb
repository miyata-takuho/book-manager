# frozen_string_literal: true

User.seed_once(:id) do |user|
  user.id = 1
  user.name = 'Test User'
  user.email = 'testuser@example.com'
  user.password = 'testuser'
end

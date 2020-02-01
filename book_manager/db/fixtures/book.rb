# frozen_string_literal: true

Book.seed_once(:id) do |book|
  book.id = 1
  book.title = 'Test Book'
  book.description = 'It was good!'
  book.user_id = 1
  book.rating = 4
end

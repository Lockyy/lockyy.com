# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'faker'

AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')

Bio.create!(content: Faker::Lorem.paragraph(sentence_count: rand(3..5)))

2.times do
  blog_category = Blog::Category.create(
    title: Faker::Lorem.sentence(word_count: rand(3..5))
  )

  3.times do
    blog_category.posts << Blog::Post.create(
      content:    Faker::Lorem.paragraphs(number: rand(3..15)).join("\n"),
      title:      Faker::Lorem.sentence,
      visible_at: Time.zone.now,
      visible:    true
    )
  end
end

2.times do
  section = Section.create(
    description: Faker::Lorem.paragraphs(number: rand(1..2)).join("\n"),
    name:        Faker::Lorem.sentence(word_count: rand(3..5))
  )

  3.times do
    section.items << Item.create(
      content: Faker::Lorem.paragraphs(number: rand(3..15)).join("\n"),
      link:    'https://www.lockyy.com',
      name:    Faker::Lorem.sentence
    )
  end
end

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
10.times do 
    User.create(
      username: Faker::Name.unique.name,
      password: "password"
    )
  end
 
  
  100.times do
    post = Post.create(
      user_id: User.all.sample.id,
      title: Faker::Quote.famous_last_words,
      content: Faker::Hipster.paragraph,
      likes: rand(10..10000)
    )
  
    (5..30).to_a.sample.times do
      Comment.create(
        post: post,
        user: User.all.sample,
        content: Faker::Hipster.paragraph,
        likes: rand(10..1000)
      )
    end
  end
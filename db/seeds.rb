require 'faker'
 
 # Create Posts
 50.times do
   Post.create!(
     title:  Faker::Lorem.sentence,
     body:   Faker::Lorem.paragraph
   )
 end
 posts = Post.all
 
 # Create Comments
 100.times do
   Comment.create!(
     post: posts.sample,
     body: Faker::Lorem.paragraph
   )
 end

 # Create Advertisements
 5.times do
   Advertisement.create!(
     title:  Faker::Lorem.word,
     copy:   Faker::Lorem.paragraph,
     price:  Faker::Commerce.price
   )
 end
 posts = Advertisement.all

# Create custom one time posts and comments
# 1.times do
  Post.first_or_create!(title: "One time", body: "Testing 1 2 3")
# end

if !Post.where(title: "One time", body: "Testing 1 2 3").first
  Post.create(title: "One time", body: "Testing 1 2 3")
end

# 1.times do
  Comment.first_or_create!(post: posts, body: "Wow, that took forever to figure out.")
# end

 puts "Seed finished"
 puts "#{Post.count} posts created"
 puts "#{Comment.count} comments created"
 puts "#{Advertisement.count} advertisements created"

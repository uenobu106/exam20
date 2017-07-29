10.times do
email = Faker::Internet.email
name = Faker::Name.name
password = "password"
avatar = Faker::Avatar.image
user = User.new(
email: email,
name: name,
password: password,
password_confirmation: password,
avatar: avatar = Faker::Avatar.image,
uid: SecureRandom.uuid,
)
user.skip_confirmation!
user.save
end

10.times do
  follower_id = [*1..10].sample
  followed_id = [*1..10].sample
  while follower_id == followed_id
    followed_id = [*1..10].sample
  end
    Relationship.find_or_create_by(
    follower_id: follower_id,
    followed_id: followed_id
  )
end

10.times do
  title = Faker::Name.title
  content = Faker::Food.spice
  user_id = [*1..10].sample
  Topic.create(
  title: title,
  content: content,
  user_id: user_id,
  )
end


10.times do
  user_id = [*1..10].sample
  topic_id = [*1..10].sample
  content = Faker::Food.spice
  Comment.create!(
    user_id: user_id,
    topic_id: topic_id,
    content: content
  )
end

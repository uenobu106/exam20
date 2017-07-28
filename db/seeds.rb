20.times do
email = Faker::Internet.email
name = Faker::LordOfTheRings.character
password = "password"
avatar = Faker::Avatar.image
user = User.new(
email: email,
name: name,
password: password,
password_confirmation: password,
avatar: avatar,
uid: SecureRandom.uuid,
)
user.skip_confirmation!
user.save
end

130.times do
  follower_id = [*1..20].sample
  followed_id = [*1..20].sample
  while follower_id == followed_id
    followed_id = [*1..20].sample
  end
    Relationship.find_or_create_by(
    follower_id: follower_id,
    followed_id: followed_id
  )
end

10.times do
  content = Faker::LordOfTheRings.character
  user_id = [*1..10].sample
  Topic.create(
  content: content,
  user_id: user_id,
  )
end


20.times do
  user_id = [*1..10].sample
  topic_id = [*1..10].sample
  content = Faker::LordOfTheRings.character
  Comment.create!(
    user_id: user_id,
    topic_id: topic_id,
    content: content
  )
end

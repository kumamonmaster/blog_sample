100.times do |i|
  Post.create!(
    user_id: rand(1..3),
    image: open("#{Rails.root}/app/assets/images/profile.jpg"),
    title: "こんにちは",
    body: "#{i}回目のこんにちは"
  )
end

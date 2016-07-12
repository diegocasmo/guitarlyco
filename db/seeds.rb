(1..100).each do
  Article.create({
    title: Faker::Book.title,
    video_link: 'https://www.youtube.com/embed/2orBJTZQNvw',
    body: Faker::Lorem.paragraphs(10).join(' ')
  })
end

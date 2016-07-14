(1..100).each do
  title = Faker::Book.title
  # 'title' must be unique across 'Article'
  until Article.find_by_title(title).blank?
   title = Faker::Book.title
  end
  Article.create({
    title: title,
    video_link: 'https://www.youtube.com/embed/2orBJTZQNvw',
    body: Faker::Lorem.paragraphs(10).join(' ')
  })
end

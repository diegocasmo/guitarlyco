# Create some Channel
[
  'UCPedKpCHqxD840ZxqXAlUdg',
  'UCSeHAIacSPWhnp2MeXj14Og',
  'UCiReSwhx7y_LpNFNg4GCuCQ',
  'UCs9Mm7ILC1_e2SL3PbPRLsA',
  'UCOHb5NwT1yHkZOTTLuU3UXQ'
].each do |youtube_id|
  Channel.create({
    youtube_id: youtube_id
  })
end

# Create some Article
(1..100).each do
  Article.create({
    title: Faker::Book.title,
    video_link: 'https://www.youtube.com/embed/2orBJTZQNvw',
    body: Faker::Lorem.paragraphs(10).join(' ')
  })
end

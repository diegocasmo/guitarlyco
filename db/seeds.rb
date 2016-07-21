# Create some Channel
[
  'UCPedKpCHqxD840ZxqXAlUdg',
  'UCSeHAIacSPWhnp2MeXj14Og',
  'UCiReSwhx7y_LpNFNg4GCuCQ',
  'UCs9Mm7ILC1_e2SL3PbPRLsA',
  'UCOHb5NwT1yHkZOTTLuU3UXQ'
].each do |youtube_channel_code|
  Channel.create({
    youtube_channel_code: youtube_channel_code
  })
end

# Get first 5 videos of the channels above and create a video
# for each of them
Channel.all.each do |channel|
  yt_channel = Yt::Channel.new(url: "https://www.youtube.com/channel/#{channel.youtube_channel_code}")
  yt_channel.videos.first(5).each do |yt_video|
    Video.create({
      channel: channel,
      youtube_video_code: yt_video.id,
      description: yt_video.description,
      title: yt_video.title,
      thumbnail_url: yt_video.thumbnail_url
    })
  end
end

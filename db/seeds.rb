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

# TODO: Use YT API to read some videos from the channels above

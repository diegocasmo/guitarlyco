FactoryGirl.define do
  factory :video do
    channel
    sequence(:youtube_video_code) { |i| "#{Faker::Code.asin}-#{i}" }
    description { Faker::Lorem.paragraph }
    title { Faker::Book.title }
    thumbnail_url { Faker::Company.logo}
  end
end

FactoryGirl.define do
  factory :channel do
    sequence(:youtube_channel_code) { |i| "#{Faker::Code.asin}-#{i}" }
  end
end

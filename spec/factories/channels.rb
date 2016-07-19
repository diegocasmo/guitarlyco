FactoryGirl.define do
  factory :channel do
    sequence(:youtube_id) { |i| "#{Faker::Code.asin}-#{i}" }
  end
end

FactoryGirl.define do
  factory :article do
    sequence(:title) { |i| "#{Faker::Book.title}-#{i}" }
    video_link { Faker::Internet.url }
    body { Faker::Lorem.paragraph }
  end
end

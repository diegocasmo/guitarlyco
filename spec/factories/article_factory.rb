FactoryGirl.define do
  factory :article do
    sequence(:title) { |n| "#{Faker::Book.title}--#{n}" }
    video_link { Faker::Internet.url }
    body { Faker::Lorem.paragraph }
  end
end

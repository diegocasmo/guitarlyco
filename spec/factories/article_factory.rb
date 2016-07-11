# Article factory
FactoryGirl.define do
  factory :article do
    title { Faker::Book.title }
    video_link { Faker::Internet.url }
    body { Faker::Lorem.paragraph }
  end
end

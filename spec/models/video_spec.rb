require 'rails_helper'

RSpec.describe Video, type: :model do

  it 'has a valid factory' do
    expect(build(:video)).to be_valid
  end

  let (:required_attrs) {
    youtube_video_code = Faker::Code.asin
    # 'youtube_video_code' must be unique across 'Video'
    until Video.find_by_youtube_video_code(youtube_video_code).blank?
     youtube_video_code = Faker::Code.asin
    end
    {
      channel: create(:channel),
      youtube_video_code: youtube_video_code,
      description: Faker::Lorem.paragraph,
      title: Faker::Book.title,
      thumbnail_url: Faker::Company.logo
    }
  }

  describe 'validations' do

    it 'should create a valid Video' do
      video = Video.new(required_attrs)
      expect(video.valid?).to eq(true)
    end

    it 'does not create an Video if a required attribute is missing' do
      required_attrs.each do |key, _value|
        video = Video.new(required_attrs.except(key))
        expect(video.valid?).to eq(false)
      end
    end
  end

  describe 'callbacks' do

    describe '#create_video_article' do

      it 'should call "#create_video_article" after a video is created' do
        video = Video.new(required_attrs)
        allow(video).to receive(:create_video_article)
        video.save()
        expect(video).to have_received(:create_video_article)
      end

      it 'should create a video with the article attrs' do
        video = create(:video)
        expect(video.article.title).to eq(video.title)
        expect(video.article.body).to eq(video.description)
      end
    end
  end
end

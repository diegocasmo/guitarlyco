require 'rails_helper'

RSpec.describe Channel, type: :model do

  it 'has a valid factory' do
    expect(build(:channel)).to be_valid
  end

  let (:required_attrs) {
    youtube_channel_code = Faker::Code.asin
    # 'youtube_channel_code' must be unique across 'Channel'
    until Channel.find_by_youtube_channel_code(youtube_channel_code).blank?
     youtube_channel_code = Faker::Code.asin
    end
    {
      youtube_channel_code: youtube_channel_code
    }
  }

  describe 'validations' do

    it 'should create a valid Channel' do
      channel = Channel.new(required_attrs)
      expect(channel.valid?).to eq(true)
    end

    it 'does not create an Channel if a required attribute is missing' do
      required_attrs.each do |key, _value|
        channel = Channel.new(required_attrs.except(key))
        expect(channel.valid?).to eq(false)
      end
    end

    it 'does not create more than 1 Channel with the same "youtube_channel_code"' do
      channel_1 = create(:channel, youtube_channel_code: 'ABC123')
      expect { create(:channel, youtube_channel_code: channel_1.youtube_channel_code) }.to raise_error(ActiveRecord::RecordInvalid)
    end
  end
end

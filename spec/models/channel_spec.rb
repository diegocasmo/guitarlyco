require 'rails_helper'

RSpec.describe Channel, type: :model do

  it 'has a valid factory' do
    expect(build(:channel)).to be_valid
  end

  let (:required_attrs) {
    youtube_id = Faker::Code.asin
    # 'youtube_id' must be unique across 'Channel'
    until Channel.find_by_youtube_id(youtube_id).blank?
     youtube_id = Faker::Code.asin
    end
    {
      youtube_id: youtube_id
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

    it 'does not create more than 1 Channel with the same "youtube_id"' do
      channel_1 = create(:channel, youtube_id: 'ABC123')
      expect { create(:channel, youtube_id: channel_1.youtube_id) }.to raise_error(ActiveRecord::RecordInvalid)
    end
  end
end

require 'rails_helper'

describe ArticlesHelper do

  describe '#get_short_body' do

    it 'returns a truncated version of the body' do
      body = Faker::Lorem.paragraphs(50).join(' ')
      expect(helper.get_short_body(body)).to eq(truncate(body, length: 300))
    end
  end
end

require 'rails_helper'

RSpec.describe Article, :type => :model do

  it 'has a valid factory' do
    expect(build(:article)).to be_valid
  end

  let (:required_attrs) {
    {
      title: Faker::Book.title,
      video_link: Faker::Internet.url,
      body: Faker::Lorem.paragraph
    }
  }

  describe 'validations' do

    it 'should create a valid Article' do
      article = Article.new(required_attrs)
      expect(article.valid?).to eq(true)
    end

    it 'does not create an Article if a required attribute is missing' do
      required_attrs.each do |key, _value|
        article = Article.new(required_attrs.except(key))
        expect(article.valid?).to eq(false)
      end
    end
  end
end

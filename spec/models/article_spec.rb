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

    it 'does not create more than 1 Article with the same title' do
      article_1 = create(:article, title: 'Diego Castillo')
      expect { create(:article, title: article_1.title) }.to raise_error(ActiveRecord::RecordInvalid)
    end
  end

  describe '#get_paginated' do

    it 'returns an array of paginated articles with default args' do
      (1..20).each { create(:article) }
      expect(Article.get_paginated(nil, nil).length).to eq(7)
    end

    it 'returns an array of paginated articles if custom args are passed to it' do
      (1..20).each { create(:article) }
      page = 1
      per_page = 3
      expect(Article.get_paginated(page, per_page).length).to eq(3)
    end
  end

  describe '#add_article_slug' do

    it 'should add a parameterized title as slug to the article' do
      article = create(:article, title: 'Diego Castillo')
      expect(article.slug).to eq('diego-castillo')
    end
  end
end

require 'rails_helper'

RSpec.describe 'routes for Articles', :type => :routing do

  it 'routes "/" GET to articles #index' do
    expect(get('/')).to route_to(
      controller: 'articles',
      action: 'index'
    )
  end

  it 'routes "/articles" GET to articles #index' do
    expect(get('/articles')).to route_to(
      controller: 'articles',
      action: 'index'
    )
  end

  it 'routes "/articles/:article_slug" GET to articles #show' do
    expect(get('/articles/some-slug')).to route_to(
      controller: 'articles',
      action: 'show',
      article_slug: 'some-slug'
    )
  end
end

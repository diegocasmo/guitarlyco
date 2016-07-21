require 'rails_helper'

RSpec.describe 'Routes', :type => :routing do

  describe 'Article Routes' do

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

    it 'routes "/articles/:id" GET to articles #show' do
      expect(get('/articles/2')).to route_to(
        controller: 'articles',
        action: 'show',
        id: '2'
      )
    end
  end

  describe 'Static Pages Routes' do

    it 'routes "/about" GET to static pages #about' do
      expect(get('/about')).to route_to(
        controller: 'static_pages',
        action: 'about'
      )
    end
  end
end

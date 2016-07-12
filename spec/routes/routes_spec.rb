require 'rails_helper'

RSpec.describe 'routes for Articles', :type => :routing do

  it 'routes "/" GET to articles #index' do
    expect(get('/')).to route_to('articles#index')
  end

  it 'routes "/articles" GET to articles #index' do
    expect(get('/articles')).to route_to('articles#index')
  end
end

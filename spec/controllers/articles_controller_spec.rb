require 'rails_helper'

RSpec.describe ArticlesController, type: :controller do

  describe 'GET #index' do
    it 'assigns @articles using pagination params' do
      articles = (1..10).map { create(:article) }
      get :index, :page => 1, :per_page => 2
      expect(assigns(:articles)).to eq(articles[0..1])
    end

   it 'renders the index template' do
      get :index
      expect(response).to render_template('index')
    end
  end
end

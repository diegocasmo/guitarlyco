require 'rails_helper'

RSpec.describe StaticPagesController, type: :controller do

  describe 'GET #about' do

   it 'renders the about template' do
      get :about
      expect(response).to render_template('about')
    end
  end
end

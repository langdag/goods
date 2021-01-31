require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  describe 'GET /index' do
    before do
      get :index
    end
    let!(:products) { create_list(:product, 10) }
    let!(:suppliers) { create_list(:supplier, 10) }

    context 'when the request is valid' do
      it 'shows products and suppliers' do
        expect(response).to be_successful 
        expect(response).to render_template(:index)        
      end
    end
  end
end
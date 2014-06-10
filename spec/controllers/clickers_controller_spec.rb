require 'rails_helper'

RSpec.describe ClickersController, :type => :controller do

  describe 'GET index' do
    it 'returns clickers' do
      get :index
      expect(assigns(:clickers)).not_to be_nil
      expect(response).to be_success
    end
  end

  describe 'POST create' do
    it 'creates clicker' do
      expect { post :create, name: 'Juan Carlos' }.to change(Clicker,:count).by(1)
      expect(response.status).to eql(200)
    end

    it 'returns forbidden with no name' do
      post :create
      expect(response.status).to eql(403)
    end

    it 'returns server error with blank name' do
      post :create, name: ''
      expect(response.status).to eql(500)
    end
  end

end

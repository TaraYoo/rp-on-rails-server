# frozen_string_literal: true

require 'rails_helper'

RSpec.describe LocationsController do
  def location_params
    {
      name: 'Baji\'s Hollow',
      plot: 'Dragon Army'
    }
  end

  def location
    Location.first
  end

  def locations
    Location.all
  end

  before(:all) do
    Location.create!(location_params)
  end

  after(:all) do
    Location.delete_all
  end

  describe 'GET index' do
    before(:each) { get :index }
    # defines a block to run before each subfunction
    it 'is successful' do
      # no need to specify route, since this is pulling from controller
      expect(response).to be_successful
      expect(response.status).to eq(200)
    end

    it 'renders a JSON response' do
      locations_response = JSON.parse(response.body)

      expect(locations_response['locations'][0].instance_of?(Hash)).to be(true)
      expect(locations_response.length).to eq(locations.length)
    end
  end

  describe 'GET show' do
    before(:each) do
      get :show, params: { id: location.id }
    end

    it 'is successful' do
      expect(response.status).to eq(200)
    end

    it 'renders a JSON response' do
      location_response = JSON.parse(response.body)

      expect(location_response['location']['id']).to eq(location.id)
    end
  end

  describe 'DELETE destroy' do
    before(:each) do
      delete :destroy, params: { id: location.id }
    end

    it 'is successful and returns an empty response' do
      expect(response.status).to eq(204)
      expect(response.body).to eq('')
      # above are not enough to check for delete. Passing in an empty function
      # fulfills the above requirements
      expect(location).to be_nil # test uses a test-only database
    end
  end

  describe 'PATCH update' do
    def location_diff
      { plot: 'nuclear war' }
    end

    before(:each) do
      patch :update, params: { id: location.id, location: location_diff }
    end

    it 'is successful' do
      expect(response.status).to eq(200)
    end

    it 'renders a JSON response' do
      location_response = JSON.parse(response.body)

      expect(location_response['location']['name']).to eq(location.name)
    end
  end

  describe 'POST create' do
    before(:each) do
      post :create, params: { location: {
        name: 'Samson Halmi',
        plot: 'Annihilation'
      } }
    end

    it 'is successful' do
      expect(response.status).to eq(201)
    end

    it 'renders a JSON response' do
      location_response = JSON.parse(response.body)

      expect(location_response['location']['name']).to eq('Samson Halmi')
    end
  end
end

# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Locations requests' do
  def location_params
    {
      name: 'Baji\'s Hollow',
      plot: 'Zombie Apocalypse'
    }
  end

  def locations
    Location.all
  end

  def location
    Location.first
  end

  before(:all) do
    Location.create!(location_params)
  end

  after(:all) do
    Location.delete_all
  end

  describe 'GET /locations' do
    it 'lists all locations' do
      get '/locations'

      expect(response).to have_http_status(200)

      locations_response = JSON.parse(response.body)

      expect(locations_response.length).to eq(locations.count)

      expect(locations_response['locations'][0]['name']).to eq(location.name)
    end
  end

  describe 'GET /locations/:id' do
    it 'lists one selected location' do
      get "/locations/#{location.id}"

      expect(response).to have_http_status(200)

      locations_response = JSON.parse(response.body)

      expect(locations_response['location']['name']).to eq(location.name)
    end
  end

  describe 'DELETE /locations/:id' do
    it 'deletes one selected location' do
      delete "/locations/#{location.id}"

      expect(response).to have_http_status(204)
      expect(response.body).to be_empty
    end
  end

  describe 'PATCH /locations/:id' do
    it 'updates one location' do
      patch "/locations/#{location.id}", params: {
        location: {
          plot: 'unending storm'
        }
      }

      expect(response).to have_http_status(200)

      location_response = JSON.parse(response.body)
      expect(location_response['location']['plot']).to eq(location.plot)
    end
  end

  describe 'POST /locations' do
    it 'creates one location' do
      post '/locations', params: {
        location: {
          name: 'Yumla\'s castle',
          plot: 'unending storm'
        }
      }

      expect(response).to have_http_status(201)

      location_response = JSON.parse(response.body)
      expect(location_response['location']['name']).to eq('Yumla\'s castle')
    end
  end
end

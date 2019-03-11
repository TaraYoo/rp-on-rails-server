# frozen_string_literal: true

require 'rails_helper'

RSpec.describe LocationsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get('/locations')).to route_to('locations#index')
    end

    it 'routes to #show' do
      expect(get('/locations/1')).to route_to(
        controller: 'locations',
        action: 'show',
        id: '1'
      )
    end

    it 'routes to #create' do
      expect(post('/locations')).to route_to(
        controller: 'locations',
        action: 'create'
      )
    end

    it 'routes to #update via PATCH' do
      expect(patch('/locations/1')).to route_to(
        controller: 'locations',
        action: 'update',
        id: '1'
      )
    end

    it 'routes to #destroy' do
      expect(delete('/locations/1')).to route_to(
        controller: 'locations',
        action: 'destroy',
        id: '1'
      )
    end
  end
end

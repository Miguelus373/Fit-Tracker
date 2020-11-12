require 'rails_helper'

RSpec.describe ExercisesController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/exercises').to route_to('exercises#index')
    end

    it 'routes to #new' do
      expect(get: '/exercises/new').to route_to('exercises#new')
    end

    it 'routes to #create' do
      expect(post: '/exercises').to route_to('exercises#create')
    end
  end
end

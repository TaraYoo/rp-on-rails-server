require "rails_helper"

RSpec.describe BokbulboksController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/bokbulboks").to route_to("bokbulboks#index")
    end


    it "routes to #show" do
      expect(:get => "/bokbulboks/1").to route_to("bokbulboks#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/bokbulboks").to route_to("bokbulboks#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/bokbulboks/1").to route_to("bokbulboks#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/bokbulboks/1").to route_to("bokbulboks#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/bokbulboks/1").to route_to("bokbulboks#destroy", :id => "1")
    end

  end
end

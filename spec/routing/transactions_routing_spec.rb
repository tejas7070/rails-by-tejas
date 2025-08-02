require "rails_helper"

RSpec.describe TransactionsController, type: :routing do
  describe "routing" do
    it "routes to #show" do
      expect(get: "/transactions/1").to route_to("transactions#show", id: "1")
    end

    it "routes to #create" do
      expect(post: "/transactions").to route_to("transactions#create")
    end
  end
end
